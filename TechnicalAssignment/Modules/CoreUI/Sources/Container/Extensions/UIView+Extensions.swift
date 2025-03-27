//
//  UIView+Extensions.swift
//  CoreUI
//
//  Created by Pham Nguyen Nhat Anh on 25/3/25.
//

import UIKit

extension UIView {
    func asImage() -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: bounds.size)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}
