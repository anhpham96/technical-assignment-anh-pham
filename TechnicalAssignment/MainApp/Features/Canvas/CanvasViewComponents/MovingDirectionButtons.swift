//
//  MovingDirectionButtons.swift
//  TechnicalAssignment
//
//  Created by Pham Nguyen Nhat Anh on 26/3/25.
//


import SwiftUI
import CoreUI

struct MovingDirectionButtons: View {
    @ObservedObject var viewModel: CanvasViewModel

    var body: some View {
        LazyHStack {
            ForEach(viewModel.movingDirectionItems, id: \.self) { item in
                Button(item.name) {
                    viewModel.moving(direction: item)
                }.buttonStyle(CoreUICustomButtonStyle(backgroundColor: .blue))
            }
        }
    }
}
