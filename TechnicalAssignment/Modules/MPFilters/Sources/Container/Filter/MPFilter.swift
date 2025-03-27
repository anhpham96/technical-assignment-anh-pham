//
//  MPFilter.swift
//  MPFilter
//
//  Created by Pham Nguyen Nhat Anh on 25/3/25.
//


import MetalPetal

public protocol MPFilter {
    func apply(to image: MTIImage) -> MTIImage?
}
