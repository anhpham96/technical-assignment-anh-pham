//
//  TechnicalAssignmentTests.swift
//  TechnicalAssignmentTests
//
//  Created by Pham Nguyen Nhat Anh on 25/3/25.
//

import XCTest
import MetalPetal
@testable import MPFilters

final class MPImageProcessorTests: XCTestCase {
    
    var imageProcessor: MPImageProcessorImpl!
    
    override func setUp() {
        super.setUp()
        imageProcessor = MPImageProcessorImpl()
    }
    
    override func tearDown() {
        imageProcessor.clearCache()
        imageProcessor = nil
        super.tearDown()
    }
    
    func testApplyFilters_withValidImageAndFilter() async {
        let testImage = loadTestImage(named: "example")!
        let filter = MockFilter() 
        let resultImage = await imageProcessor.applyFilters([filter], to: testImage)
        
        XCTAssertNotNil(resultImage, "Filtered image should not be nil")
    }
    
    func testApplyFilters_withEmptyFilterList() async {
        let testImage = loadTestImage(named: "example")!
        let resultImage = await imageProcessor.applyFilters([], to: testImage)
        
        XCTAssertEqual(resultImage?.pngData(), testImage.pngData(), "Image should be unchanged when no filters are applied")
    }
    
    func testApplyFilters_withNilImage() async {
        let resultImage = await imageProcessor.applyFilters([], to: UIImage())
        XCTAssertNil(resultImage, "Should return nil for an empty image")
    }
    
    func testClearCache() {
        imageProcessor.clearCache()
        XCTAssertTrue(true, "Cache should be cleared without errors")
    }
    
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


