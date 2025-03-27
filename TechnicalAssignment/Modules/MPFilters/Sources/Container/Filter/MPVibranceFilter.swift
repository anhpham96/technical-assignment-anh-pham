//
//  VibranceFilter.swift
//  MPFilters
//
//  Created by Pham Nguyen Nhat Anh on 25/3/25.
//


import MetalPetal

public class MPVibranceFilter: MPFilter,  @unchecked Sendable {
    private var amount: Float
    
    public init(amount: Float) {
        self.amount = amount
    }
    
    public func apply(to image: MTIImage) -> MTIImage? {
        let filter = MTIVibranceFilter()
        filter.inputImage = image
        filter.amount = amount
        return filter.outputImage
    }
}
