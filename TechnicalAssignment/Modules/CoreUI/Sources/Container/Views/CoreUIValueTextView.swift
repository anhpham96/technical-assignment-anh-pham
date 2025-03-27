//
//  CoreUIValueTextView.swift
//  CoreUI
//
//  Created by Pham Nguyen Nhat Anh on 26/3/25.
//

import SwiftUI

public struct CoreUIValueTextView<T: CustomStringConvertible>: View {
    
    @Binding var value: T
    
    let title: String
    
    public init(value: Binding<T>, title: String) {
        self._value = value
        self.title = title
    }
    
    public var body: some View {
        HStack(alignment: .center) {
            Text(title)
                .font(.headline)
            Text(formattedValue)
                .font(.body)
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(5)
        .overlay {
            RoundedRectangle(cornerRadius: 5)
                .stroke(style: StrokeStyle(
                    lineWidth: 2,
                    lineCap: .round,
                    lineJoin: .round,
                    dash: [10, 5] // 10 là độ dài nét, 5 là khoảng cách giữa các nét
                ))
                .fill(Color.gray.opacity(0.5))
        }
    }
    
    private var formattedValue: String {
        if let number = value as? Double {
            return String(format: "%.2f", number)
        } else if let number = value as? Float {
            return String(format: "%.2f", number)
        } else {
            return value.description
        }
    }
}

#Preview {
    @Previewable @State var sampleValue: Int = 42
    return CoreUIValueTextView(value: $sampleValue, title: "Number")
}


    
