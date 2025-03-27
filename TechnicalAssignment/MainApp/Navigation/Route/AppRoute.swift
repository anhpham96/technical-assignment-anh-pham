//
//  AppRoute.swift
//  TechnicalAssignment
//
//  Created by Pham Nguyen Nhat Anh on 26/3/25.
//

import UIKit

protocol BaseRoute: Hashable {
    
}

enum AppRoute: BaseRoute {
    case canvas(image: UIImage)
    case photoEdit(image: UIImage)
    
    
    var viewName: String {
        switch self {
        case .canvas(_):
            return "canvas_view_name".localized
        case .photoEdit(_):
            return "photo_edit_view_name".localized
        }
    }
}
