//
//  CLAHEFilterTests.swift
//  MPFilters
//
//  Created by Pham Nguyen Nhat Anh on 27/3/25.
//


import XCTest
import MetalPetal
@testable import MPFilters

final class MPCLAHEFilterTests: XCTestCase {
    
    func testApplyFilter_withValidImage() {
        // Arrange
        guard let testImage = loadTestImage(named: "example") else {
            XCTFail("Test image not found")
            return
        }
        
        let mtiImage = MTIImage(ciImage: CIImage(image: testImage)!, isOpaque: false).unpremultiplyingAlpha()
        let filter = MPCLAHEFilter(clipLimit: 2.0, tileSize: 8)
        
        // Act
        let outputImage = filter.apply(to: mtiImage)
        
        // Assert
        XCTAssertNotNil(outputImage, "Output image should not be nil after applying filter")
    }
    
    func testApplyFilter_withDifferentParameters() {
        // Arrange
        guard let testImage = loadTestImage(named: "example") else {
            XCTFail("Test image not found")
            return
        }
        
        let mtiImage = MTIImage(ciImage: CIImage(image: testImage)!, isOpaque: false).unpremultiplyingAlpha()
        
        let filter1 = MPCLAHEFilter(clipLimit: 1.0, tileSize: 4)
        let filter2 = MPCLAHEFilter(clipLimit: 5.0, tileSize: 16)
        
        // Act
        let outputImage1 = filter1.apply(to: mtiImage)
        let outputImage2 = filter2.apply(to: mtiImage)
        
        // Assert
        XCTAssertNotNil(outputImage1, "Output image should not be nil with clipLimit 1.0, tileSize 4")
        XCTAssertNotNil(outputImage2, "Output image should not be nil with clipLimit 5.0, tileSize 16")
    }
    
    // Helper function to load test image from bundle
    func loadTestImage(named name: String) -> UIImage? {
        let bundle = Bundle.module
        guard let url = bundle.url(forResource: name, withExtension: "jpg"),
              let data = try? Data(contentsOf: url),
              let image = UIImage(data: data) else {
            return nil
        }
        return image
    }
}
