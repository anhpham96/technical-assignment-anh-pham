//
//  SwiftUIView.swift
//  CoreUI
//
//  Created by Pham Nguyen Nhat Anh on 25/3/25.
//

import SwiftUI

public struct CoreUIGridView: UIViewRepresentable {
    var gridSize: Int
    var image: UIImage
    var indexRow: Int
    var indexCol: Int
    var onImageGenerated: (UIImage) -> Void
    
    public init(gridSize: Int, image: UIImage, indexRow: Int, indexCol: Int, onImageGenerated: @escaping (UIImage) -> Void) {
        self.gridSize = gridSize
        self.image = image
        self.indexRow = indexRow
        self.indexCol = indexCol
        self.onImageGenerated = onImageGenerated
    }
    
    public func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .white
        
        Task { @MainActor in
            CoreUIGridDrawer.drawGrid(on: view, size: gridSize, image: image, indexRow: indexRow, indexCol: indexCol)
            generateImage(from: view)
        }
        
        return view
    }
    
    public func updateUIView(_ uiView: UIView, context: Context) {
        Task { @MainActor in
            uiView.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
            CoreUIGridDrawer.drawGrid(on: uiView, size: gridSize, image: image, indexRow: indexRow, indexCol: indexCol)
            generateImage(from: uiView)
        }
    }
    
    @MainActor
    private func generateImage(from view: UIView) {
        Task { @MainActor in
            if let image = view.asImage() {
                onImageGenerated(image)
            }
        }
    }
}
