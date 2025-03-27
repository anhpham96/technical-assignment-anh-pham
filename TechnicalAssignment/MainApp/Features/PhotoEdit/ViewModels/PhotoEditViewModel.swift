//
//  PhotoEditViewModel.swift
//  TechnicalAssignment
//
//  Created by Pham Nguyen Nhat Anh on 25/3/25.
//

import SwiftUI
import MPFilters
import Combine

class PhotoEditViewModel: BaseViewModel {
    @Published var processedImage: UIImage?
    @Published var inputImage: UIImage

    @Published var vibrance: Float = 0
    @Published var clahe: Float = 0.0
    @Published var tileSize: Int = 8

    private let imageProcessor: MPImageProcessor
    let title: String
    
    init(title: String, inputImage: UIImage, imageProcessor: MPImageProcessor = MPImageProcessorImpl()) {
        self.inputImage = inputImage
        self.title = title
        self.imageProcessor = imageProcessor
        super.init()
        setupObservers() 
    }
    
    private func setupObservers() {
        Publishers.CombineLatest3($vibrance, $clahe, $tileSize)
            .sink { [weak self] _, _, _ in
                Task {
                    await self?.applyFilters()
                }
            }
            .store(in: &bag)
        
        $inputImage
            .sink { [weak self] inputImage in
                guard let self else { return }
                self.processedImage = inputImage
                Task {
                    await self.applyFilters()
                }
            }
            .store(in: &bag)
    }
    
    @MainActor
    func applyFilters() async {
        let filters: [MPFilter] = [
            MPVibranceFilter(amount: vibrance),
            MPCLAHEFilter(clipLimit: clahe, tileSize: tileSize)
        ]
        
        
        if let image = await imageProcessor.applyFilters(filters, to: self.inputImage) {
            self.processedImage = image
        }
    }
    
    deinit {
        imageProcessor.clearCache()
    }
}
