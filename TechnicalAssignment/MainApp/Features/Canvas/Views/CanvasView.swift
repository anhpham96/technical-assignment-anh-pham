//
//  CanvasView.swift
//  TechnicalAssignment
//
//  Created by Pham Nguyen Nhat Anh on 25/3/25.
//

import SwiftUI
import CoreUI

import SwiftUI

struct CanvasView: View {
    @StateObject var viewModel: CanvasViewModel
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                gridView
                    .frame(width: geometry.size.width, height: geometry.size.width)
                generatedImageView
                GridSizeButtons(viewModel: viewModel)
                MovingDirectionButtons(viewModel: viewModel)
            }.frame(width: geometry.size.width, height: geometry.size.height)
        }
        .navigationTitle(viewModel.title)
    }
    
    var gridView: some View {
        CoreUIGridView(gridSize: viewModel.gridSize, image: viewModel.image, indexRow: viewModel.indexRow, indexCol: viewModel.indexCol) { image in
            viewModel.generatedImage = image
        }
        .border(Color.black)
    }
    
    @ViewBuilder
    var generatedImageView: some View {
        if let image = viewModel.generatedImage {
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
        }
    }
}



#Preview {
    CanvasView(viewModel: .init(title: "", image: .checkmark))
}
