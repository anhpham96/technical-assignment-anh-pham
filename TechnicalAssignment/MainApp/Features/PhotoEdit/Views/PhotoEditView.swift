//
//  PhotoEditView.swift
//  TechnicalAssignment
//
//  Created by Pham Nguyen Nhat Anh on 25/3/25.
//

import SwiftUI
import CoreUI

struct PhotoEditView: View {
    
    @EnvironmentObject var navigator: AppNavigator
    @StateObject var viewModel: PhotoEditViewModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                imageView
                sliderStack
            }
            .padding()
        }
        .navigationTitle(viewModel.title)
    }
    
    var imageView: some View {
        CoreUIProcessingImageView(processedImage: $viewModel.processedImage, inputImage: viewModel.inputImage)
    }
    
    var sliderStack: some View {
        LazyVStack(spacing: 50) {
            ForEach(SliderConfig.allCases, id: \..self) { config in
                CoreUISliderControlView(value: config.binding(for: viewModel),                           title: config.title,
                                        minValue: config.minValue,
                                        maxValue: config.maxValue,
                                        step: config.step,
                                        color: config.color,
                                        showIndicator: config.showIndicator)
            }
        }
        .padding()
    }
}



#Preview {
    PhotoEditView(viewModel: .init(title: "", inputImage: UIImage(named: "abc")!))
}


