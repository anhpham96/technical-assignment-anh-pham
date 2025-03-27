//
//  CoreUISlider.swift
//  CoreUI
//
//  Created by Pham Nguyen Nhat Anh on 26/3/25.
//


import SwiftUI

public struct CoreUISlider<T: BinaryFloatingPoint & CustomStringConvertible>: View {
    
    @Binding var value: T
    let minValue: T
    let maxValue: T
    let step: T
    let isShowIndicator: Bool
    let color: Color
    private let thumbRadius: CGFloat = 12
    
    public init(value: Binding<T>, minValue: T, maxValue: T, step: T, isShowIndicator: Bool = false, color: Color = .orange) {
        self._value = value
        self.minValue = minValue
        self.maxValue = maxValue
        self.step = step
        self.isShowIndicator = isShowIndicator
        self.color = color
    }
    
    public var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                //-- Track
                RoundedRectangle(cornerRadius: 4)
                    .fill(color.opacity(0.5))
                    .frame(height: 8)
                
                if isShowIndicator {
                    //-- Center Indicator
                    RoundedRectangle(cornerRadius: 1)
                        .fill(color.opacity(0.5))
                        .frame(width: 2, height: 40)
                        .offset(x: geometry.size.width / 2 - 1)
                }
                
                //-- Tinted track
                let valueFraction = CGFloat((value - minValue) / (maxValue - minValue))
                let tintedTrackWidth = geometry.size.width * valueFraction
                
                Rectangle()
                    .fill(color)
                    .frame(width: abs(tintedTrackWidth), height: 8)
                
                //-- Thumb
                Circle()
                    .fill(Color.white)
                    .stroke(color, lineWidth: 3)
                    .frame(width: thumbRadius * 2)
                    .offset(x: valueFraction * geometry.size.width - thumbRadius)
                    .gesture(
                        DragGesture(minimumDistance: 0)
                            .onChanged { gesture in
                                updateValue(with: gesture, in: geometry)
                            }
                    )
                    .animation(.easeInOut(duration: 0.1), value: value)
            }
            .frame(height: 40)
        }
        .padding(.horizontal, thumbRadius)
    }
    
    private func updateValue(with gesture: DragGesture.Value, in geometry: GeometryProxy) {
        let dragFraction = T(gesture.location.x / geometry.size.width)
        let newValue = (maxValue - minValue) * dragFraction + minValue
        
        let steppedValue = (round(newValue / step) * step)
        
        value = min(max(steppedValue, minValue), maxValue)
    }
}
