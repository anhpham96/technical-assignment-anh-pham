//
//  PhotoEditViewModelTests.swift
//  TechnicalAssignment
//
//  Created by Pham Nguyen Nhat Anh on 27/3/25.
//


import XCTest
import UIKit
import Combine
@testable import TechnicalAssignment
import MPFilters

final class PhotoEditViewModelTests: XCTestCase {
    var cancellables: Set<AnyCancellable> = []
    
    func testApplyFilters_updatesProcessedImage() async {
        // Arrange
        let testImage = UIImage(named: "example.jpg")!
        let imageProcessor: MPImageProcessor = MPImageProcessorImpl()
        let viewModel = PhotoEditViewModel(title: "Test", inputImage: testImage, imageProcessor: imageProcessor)
        
        // Act
        viewModel.vibrance = 1.0
        viewModel.clahe = 2.0
        viewModel.tileSize = 8

        // Wait for Combine to process
        try? await Task.sleep(nanoseconds: 500_000_000) 
        
        // Assert
        XCTAssertNotNil(viewModel.processedImage, "Processed image should be updated after applying filters")
    }

    func testChangingInputImage_triggersProcessing() async {
        // Arrange
        let testImage1 = UIImage(named: "example.jpg")!
        let testImage2 = UIImage(named: "example2.jpg")!
        let imageProcessor = MPImageProcessorImpl()
        let viewModel = PhotoEditViewModel(title: "Test", inputImage: testImage1, imageProcessor: imageProcessor)
        
        // Act
        viewModel.inputImage = testImage2

        // Wait for Combine to process
        try? await Task.sleep(nanoseconds: 500_000_000) 
        
        // Assert
        XCTAssertNotNil(viewModel.processedImage, "Processed image should be updated after applying filters")
    }
}
