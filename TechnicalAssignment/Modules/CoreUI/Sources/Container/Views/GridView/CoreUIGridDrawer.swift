//
//  GridDrawer.swift
//  CoreUI
//
//  Created by Pham Nguyen Nhat Anh on 25/3/25.
//


import UIKit

import SwiftUI
import QuartzCore

/// A utility struct for drawing a grid on a UIView.
import UIKit

public struct CoreUIGridDrawer {
    
    /// Draws a grid on the specified view with the given parameters.
    ///
    /// - Parameters:
    ///   - view: The `UIView` where the grid will be drawn.
    ///   - size: The number of cells per row and column.
    ///   - image: The `UIImage` to be placed in the grid.
    ///   - indexRow: The row index where the image will be placed.
    ///   - indexCol: The column index where the image will be placed.
    @MainActor
    public static func drawGrid(on view: UIView, size: Int, image: UIImage, indexRow: Int, indexCol: Int) {
        view.layer.sublayers?.removeAll()
        
        let spacing = view.bounds.width / (CGFloat(size) * 5)
        let cellSize = (view.bounds.width - (CGFloat(size + 1) * spacing)) / CGFloat(size)
        
        drawGridBackground(on: view)
        drawGridLines(on: view, size: size, spacing: spacing, cellSize: cellSize)
        addImage(to: view, image: image, cellSize: cellSize, spacing: spacing, indexRow: indexRow, indexCol: indexCol)
    }
    
    /// Sets the background color of the grid.
    @MainActor
    private static func drawGridBackground(on view: UIView) {
        view.backgroundColor = UIColor.lightGray
    }
    
    /// Draws the grid lines.
    @MainActor
    private static func drawGridLines(on view: UIView, size: Int, spacing: CGFloat, cellSize: CGFloat) {
        let gridLayer = CAShapeLayer()
        let path = UIBezierPath()
        
        for row in 0..<size {
            for col in 0..<size {
                let rect = CGRect(
                    x: CGFloat(col) * (cellSize + spacing) + spacing,
                    y: CGFloat(row) * (cellSize + spacing) + spacing,
                    width: cellSize,
                    height: cellSize
                )
                path.append(UIBezierPath(rect: rect))
                
                let squareLayer = CAShapeLayer()
                squareLayer.path = UIBezierPath(rect: rect).cgPath
                squareLayer.fillColor = UIColor.white.cgColor
                view.layer.addSublayer(squareLayer)
            }
        }
        
        gridLayer.path = path.cgPath
        gridLayer.strokeColor = UIColor.black.cgColor
        gridLayer.fillColor = UIColor.clear.cgColor
        view.layer.addSublayer(gridLayer)
    }
    
    /// Adds an image to a specific grid cell.
    
    @MainActor
    private static func addImage(to view: UIView, image: UIImage, cellSize: CGFloat, spacing: CGFloat, indexRow: Int, indexCol: Int) {
        let imageRect = getImageRect(image: image, cellSize: cellSize, spacing: spacing, indexRow: indexRow, indexCol: indexCol)
        let imageLayer = CALayer()
        imageLayer.frame = imageRect
        imageLayer.contents = image.cgImage
        imageLayer.contentsGravity = .resize
        view.layer.addSublayer(imageLayer)
    }
    
    /// Calculates the CGRect for positioning an image inside a grid cell.
    private static func getImageRect(image: UIImage, cellSize: CGFloat, spacing: CGFloat, indexRow: Int, indexCol: Int) -> CGRect {
        let originalSize = image.size
        let scale = min(cellSize / originalSize.width, cellSize / originalSize.height)
        let scaledWidth = originalSize.width * scale
        let scaledHeight = originalSize.height * scale

        return CGRect(
            x: CGFloat(indexCol) * (cellSize + spacing) + spacing + (cellSize - scaledWidth) / 2,
            y: CGFloat(indexRow) * (cellSize + spacing) + spacing + (cellSize - scaledHeight) / 2,
            width: scaledWidth,
            height: scaledHeight
        )
    }
}
