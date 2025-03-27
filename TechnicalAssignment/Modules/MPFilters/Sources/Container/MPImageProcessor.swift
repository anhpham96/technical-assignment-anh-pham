//
//  ImageProcessor.swift
//  MPFilters
//
//  Created by Pham Nguyen Nhat Anh on 25/3/25.
//


import MetalPetal
import UIKit

/// A protocol defining an image processing interface.
public protocol MPImageProcessor {
    
    /// Applies a list of filters to the given image asynchronously.
    ///
    /// - Parameters:
    ///   - filters: An array of `MPFilter` objects to be applied.
    ///   - image: The `UIImage` to process.
    /// - Returns: A new `UIImage` with the applied filters, or `nil` if processing fails.
    @MainActor
    func applyFilters(_ filters: [MPFilter], to image: UIImage) async -> UIImage?
    
    /// Clears any cached image processing data.
    func clearCache()
}

public class MPImageProcessorImpl: MPImageProcessor {
    private lazy var context: MTIContext? = {
        guard let device = MTLCreateSystemDefaultDevice() else { return nil }
        let options = MTIContextOptions()
        options.workingPixelFormat = .bgra8Unorm
        return try? MTIContext(device: device, options: options)
    }()
    
    private var taskHandle: Task<UIImage?, Never>?
    
    public init() {}

    @MainActor
    public func applyFilters(_ filters: [MPFilter], to image: UIImage) async -> UIImage? {
        taskHandle?.cancel()
        
        taskHandle = Task(priority: .userInitiated) { [weak self] in
            guard let self = self else { return nil }
            return await self.applyFiltersInternal(filters, to: image)
        }
        
        return await taskHandle?.value
    }
    
    private func applyFiltersInternal(_ filters: [MPFilter], to image: UIImage) async -> UIImage? {
        guard let context = self.context else { return nil }
        guard let cgImage = image.cgImage else { return nil }
        guard !filters.isEmpty else { return image }
        
        let ciImage = CIImage(cgImage: cgImage)
        var mtiImage = MTIImage(ciImage: ciImage, isOpaque: false)
        if mtiImage.alphaType == .premultiplied {
            mtiImage = mtiImage.unpremultiplyingAlpha()
        }
        
        for filter in filters {
            if let output = filter.apply(to: mtiImage) {
                mtiImage = output
            }
        }
        
        guard let finalImage = try? context.makeCGImage(from: mtiImage) else { return nil }
        return UIImage(cgImage: finalImage)
    }
    
    
    public func clearCache() {
        context?.reclaimResources()
        context = nil
    }
}
