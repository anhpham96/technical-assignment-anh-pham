//
//  SliderControlView.swift
//  CoreUI
//
//  Created by Pham Nguyen Nhat Anh on 26/3/25.
//

import SwiftUI

public struct CoreUISliderControlView<T: BinaryFloatingPoint & CustomStringConvertible>: View {
    @Binding var value: T
    let title: String
    let minValue: T
    let maxValue: T
    let step: T
    var color: Color = .blue
    var showIndicator: Bool = false
    
    public init(value: Binding<T>, title: String, minValue: T, maxValue: T, step: T, color: Color, showIndicator: Bool) {
        self._value = value
        self.title = title
        self.minValue = minValue
        self.maxValue = maxValue
        self.step = step
        self.color = color
        self.showIndicator = showIndicator
    }
    
    public var body: some View {
        VStack(spacing: 20) {
            CoreUIValueTextView<T>(value: $value, title: title)
            CoreUISlider(value: $value,
                         minValue: minValue,
                         maxValue: maxValue,
                         step: step,
                         isShowIndicator: showIndicator,
                         color: color)
        }
    }
}
