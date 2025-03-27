//
//  CanvasViewModel.swift
//  TechnicalAssignment
//
//  Created by Pham Nguyen Nhat Anh on 25/3/25.
//

import Foundation
import UIKit

class CanvasViewModel: BaseViewModel {
    
    @Published var gridSize: Int = 2
    @Published var generatedImage: UIImage? = nil
    @Published var indexRow: Int = 0
    @Published var indexCol: Int = 0
    
    let title: String
    let image: UIImage
    
    @Published var gridSizeItems: [GridSize] = [.two, .three, .nine, .custom(5)]
    @Published var movingDirectionItems: [MovingDirection] = [.up, .down, .left, .right]
    
    init(title: String, image: UIImage) {
        self.title = title
        self.image = image
        super.init()
        
        $gridSize
            .sink { [weak self] _ in
                guard let self else { return }
                self.resetPosition()
            }.store(in: &bag)
    }
    
    func resetPosition() {
        indexRow = 0
        indexCol = 0
    }
    
    func moving(direction: MovingDirection) {
        switch direction {
        case .left:
            indexCol = max(0, indexCol - 1)
        case .right:
            indexCol = min(gridSize - 1, indexCol + 1)
        case .up:
            indexRow = max(0, indexRow - 1)
        case .down:
            indexRow = min(gridSize - 1, indexRow + 1)
        }
    }
    
    func setGridSize(_ size: CanvasViewModel.GridSize) {
        self.gridSize = size.value
    }
    
}
