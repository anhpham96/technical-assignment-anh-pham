//
//  CanvasViewModel.swift
//  TechnicalAssignment
//
//  Created by Pham Nguyen Nhat Anh on 25/3/25.
//

import Foundation
import UIKit

extension CanvasViewModel {
    enum MovingDirection: String, CaseIterable {
        case left, right, up, down
        
        var name: String {
            rawValue.localized.capitalized
        }
    }
    
    enum GridSize: Hashable {
        case two, three, nine
        case custom(Int)
        
        var name: String {
            "\(value)x\(value)"
        }
        
        var value: Int {
            switch self {
            case .two:
                return 2
            case .three:
                return 3
            case .nine:
                return 9
            case .custom(let value):
                return value
            }
        }
    }
}
