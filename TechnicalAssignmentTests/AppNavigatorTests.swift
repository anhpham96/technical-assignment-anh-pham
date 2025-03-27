//
//  AppNavigatorTests.swift
//  TechnicalAssignment
//
//  Created by Pham Nguyen Nhat Anh on 27/3/25.
//


import XCTest
@testable import TechnicalAssignment

final class AppNavigatorTests: XCTestCase {
    
    func testGoToRoute() {
        let navigator = AppNavigator()
        let mockRoute = MockRoute()
        
        XCTAssertEqual(navigator.path.count, 0)
        
        navigator.goTo(route: mockRoute)
        
        XCTAssertEqual(navigator.path.count, 1)
    }
    
    func testPopRoute() {
        let navigator = AppNavigator()
        let mockRoute = MockRoute()
        
        navigator.goTo(route: mockRoute)
        XCTAssertEqual(navigator.path.count, 1)
        
        navigator.pop()
        XCTAssertEqual(navigator.path.count, 0)
    }
    
    func testPopOnEmptyPath() {
        let navigator = AppNavigator()
        
        XCTAssertEqual(navigator.path.count, 0)
        
        navigator.pop() // Không nên crash
        XCTAssertEqual(navigator.path.count, 0)
    }
}

// Mock Route để test
struct MockRoute: BaseRoute, Hashable {}
