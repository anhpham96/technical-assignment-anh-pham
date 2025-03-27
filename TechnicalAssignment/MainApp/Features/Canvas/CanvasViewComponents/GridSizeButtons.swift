//
//  GridSizeButtons.swift
//  TechnicalAssignment
//
//  Created by Pham Nguyen Nhat Anh on 26/3/25.
//

import SwiftUI
import CoreUI

struct GridSizeButtons: View {
    @ObservedObject var viewModel: CanvasViewModel

    var body: some View {
        LazyHStack {
            ForEach(viewModel.gridSizeItems, id: \.self) { item in
                Button(item.name) {
                    viewModel.setGridSize(item)
                }.buttonStyle(CoreUICustomButtonStyle(backgroundColor: .green))
            }
        }
    }
}
