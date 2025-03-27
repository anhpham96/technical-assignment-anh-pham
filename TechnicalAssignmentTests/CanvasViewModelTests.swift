//
//  CanvasViewModelTests.swift
//  TechnicalAssignment
//
//  Created by Pham Nguyen Nhat Anh on 27/3/25.
//


import XCTest
import UIKit
import Combine
@testable import TechnicalAssignment

final class CanvasViewModelTests: XCTestCase {
    var cancellables: Set<AnyCancellable> = []
    
    func testInitialValues() {
        // Arrange
        let testImage = UIImage(named: "example.jpg")!
        let viewModel = CanvasViewModel(title: "Test Canvas", image: testImage)
        
        // Assert
        XCTAssertEqual(viewModel.gridSize, 2, "Default grid size should be 2")
        XCTAssertEqual(viewModel.indexRow, 0, "Initial row index should be 0")
        XCTAssertEqual(viewModel.indexCol, 0, "Initial column index should be 0")
        XCTAssertNil(viewModel.generatedImage, "Generated image should be nil initially")
    }
    
    func testSetGridSize_updatesGridSize() {
        // Arrange
        let testImage = UIImage(named: "example.jpg")!
        let viewModel = CanvasViewModel(title: "Test Canvas", image: testImage)
        
        // Act
        viewModel.setGridSize(.three)
        
        // Assert
        XCTAssertEqual(viewModel.gridSize, 3, "Grid size should be updated to 3")
    }

    func testResetPosition() {
        // Arrange
        let testImage = UIImage(named: "example.jpg")!
        let viewModel = CanvasViewModel(title: "Test Canvas", image: testImage)
        
        // Act
        viewModel.indexRow = 1
        viewModel.indexCol = 1
        viewModel.resetPosition()
        
        // Assert
        XCTAssertEqual(viewModel.indexRow, 0, "Row index should be reset to 0")
        XCTAssertEqual(viewModel.indexCol, 0, "Column index should be reset to 0")
    }

    func testMoving_left_right_up_down() {
        // Arrange
        let testImage = UIImage(named: "example.jpg")!
        let viewModel = CanvasViewModel(title: "Test Canvas", image: testImage)
        
        // Act & Assert
        viewModel.moving(direction: .left)
        XCTAssertEqual(viewModel.indexCol, 0, "Should not move left beyond 0")
        
        viewModel.moving(direction: .right)
        XCTAssertEqual(viewModel.indexCol, 1, "Should move right within bounds")
        
        viewModel.moving(direction: .up)
        XCTAssertEqual(viewModel.indexRow, 0, "Should not move up beyond 0")
        
        viewModel.moving(direction: .down)
        XCTAssertEqual(viewModel.indexRow, 1, "Should move down within bounds")
    }
}
