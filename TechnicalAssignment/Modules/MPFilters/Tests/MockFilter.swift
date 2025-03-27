//
//  MockFilter.swift
//  MPFilters
//
//  Created by Pham Nguyen Nhat Anh on 27/3/25.
//

import XCTest
import MetalPetal
@testable import MPFilters

class MockFilter: MPFilter {
    func apply(to image: MTIImage) -> MTIImage? {
        return image
    }
}
