//
//  AppNavigator.swift
//  TechnicalAssignment
//
//  Created by Pham Nguyen Nhat Anh on 26/3/25.
//

import Foundation
import SwiftUI

class AppNavigator: ObservableObject {
    @Published var path = NavigationPath()
    
    func goTo(route: any BaseRoute) {
        path.append(route)
    }
    
    func pop() {
        if path.count == 0 { return }
        path.removeLast()
    }
    
}
