//
//  SliderConfig.swift
//  TechnicalAssignment
//
//  Created by Pham Nguyen Nhat Anh on 26/3/25.
//

import SwiftUI

enum SliderConfig: CaseIterable {
    case vibrance, clahe, tileSize
    
    var title: String {
        switch self {
        case .vibrance: return "vibrance_title".localized
        case .clahe: return "clahe_title".localized
        case .tileSize: return "tile_size_title".localized
        }
    }
    
    var minValue: Float {
        switch self {
        case .vibrance: return -1.0
        case .clahe: return 0.0
        case .tileSize: return 4.0
        }
    }
    
    var maxValue: Float {
        switch self {
        case .vibrance: return 1.0
        case .clahe: return 10.0
        case .tileSize: return 16.0
        }
    }
    
    var step: Float {
        switch self {
        case .vibrance, .clahe: return 0.01
        case .tileSize: return 1.0
        }
    }
    
    var color: Color {
        switch self {
        case .vibrance: return .blue
        case .clahe: return .purple
        case .tileSize: return .pink
        }
    }
    
    var showIndicator: Bool {
        switch self {
        case .vibrance: return true
        case .clahe, .tileSize: return false
        }
    }
    
    func binding(for viewModel: PhotoEditViewModel) -> Binding<Float> {
        switch self {
        case .vibrance: return Binding(
            get: { Float(viewModel.vibrance) },
            set: { viewModel.vibrance = Float($0)
            })
        case .clahe: return Binding(
            get: { Float(viewModel.clahe) },
            set: { viewModel.clahe = Float($0)})
        case .tileSize: return Binding(
            get: { Float(viewModel.tileSize) },
            set: { viewModel.tileSize = Int($0)})
        }
    }
}
