//
//  CoreUIProcessingImageView.swift
//  CoreUI
//
//  Created by Pham Nguyen Nhat Anh on 26/3/25.
//

import SwiftUI

public struct CoreUIProcessingImageView: View {
    
    @Binding var processedImage: UIImage?
    
    let inputImage: UIImage
    
    public init(processedImage: Binding<UIImage?>, inputImage: UIImage) {
        self._processedImage = processedImage
        self.inputImage = inputImage
    }
    
    public var body: some View {
        if let processedImage = processedImage {
            Image(uiImage: processedImage)
                .resizable()
                .scaledToFit()
        } else {
            Image(uiImage: inputImage)
                .resizable()
                .scaledToFit()
        }
    }
}

#Preview {
    CoreUIProcessingImageView(processedImage: .constant(nil), inputImage: UIImage())
}
