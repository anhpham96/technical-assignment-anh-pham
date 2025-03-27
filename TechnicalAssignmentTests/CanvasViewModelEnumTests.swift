//
//  CanvasViewModelEnumTests.swift
//  TechnicalAssignment
//
//  Created by Pham Nguyen Nhat Anh on 27/3/25.
//


import XCTest
@testable import TechnicalAssignment

final class CanvasViewModelEnumTests: XCTestCase {
    
    func testMovingDirectionNames() {
        XCTAssertEqual(CanvasViewModel.MovingDirection.left.name, "Left")
        XCTAssertEqual(CanvasViewModel.MovingDirection.right.name, "Right")
        XCTAssertEqual(CanvasViewModel.MovingDirection.up.name, "Up")
        XCTAssertEqual(CanvasViewModel.MovingDirection.down.name, "Down")
    }

    func testGridSizeValues() {
        XCTAssertEqual(CanvasViewModel.GridSize.two.value, 2)
        XCTAssertEqual(CanvasViewModel.GridSize.three.value, 3)
        XCTAssertEqual(CanvasViewModel.GridSize.nine.value, 9)
        XCTAssertEqual(CanvasViewModel.GridSize.custom(5).value, 5)
    }

    func testGridSizeNames() {
        XCTAssertEqual(CanvasViewModel.GridSize.two.name, "2x2")
        XCTAssertEqual(CanvasViewModel.GridSize.three.name, "3x3")
        XCTAssertEqual(CanvasViewModel.GridSize.nine.name, "9x9")
        XCTAssertEqual(CanvasViewModel.GridSize.custom(7).name, "7x7")
    }
}
