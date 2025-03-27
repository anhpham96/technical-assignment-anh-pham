//
//  CLAHEFilter.swift
//  MPFilters
//
//  Created by Pham Nguyen Nhat Anh on 25/3/25.
//


import MetalPetal

public class MPCLAHEFilter: MPFilter {
    
    private var clipLimit: Float
    private var tileSize: UInt

    public init(clipLimit: Float, tileSize: Int) {
        self.clipLimit = clipLimit
        self.tileSize = UInt(tileSize)
    }
    
    public func apply(to image: MTIImage) -> MTIImage? {
        let filter = MTICLAHEFilter()
        filter.inputImage = image
        filter.clipLimit = clipLimit
        filter.tileGridSize = MTICLAHESize(width: tileSize, height: tileSize)
        return filter.outputImage
    }
}
