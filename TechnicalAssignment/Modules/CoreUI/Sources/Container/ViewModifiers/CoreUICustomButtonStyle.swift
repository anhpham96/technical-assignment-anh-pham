//
//  CoreUICustomButtonStyle.swift
//  CoreUI
//
//  Created by Pham Nguyen Nhat Anh on 25/3/25.
//

import SwiftUI

public struct CoreUICustomButtonStyle: ButtonStyle {
    public var backgroundColor: Color

    public init(backgroundColor: Color) {
        self.backgroundColor = backgroundColor
    }

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(backgroundColor)
            .foregroundColor(.white)
            .cornerRadius(8)
            .opacity(configuration.isPressed ? 0.7 : 1.0) // Hiệu ứng mờ khi bấm
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0) // Hiệu ứng thu nhỏ khi bấm
    }
}
