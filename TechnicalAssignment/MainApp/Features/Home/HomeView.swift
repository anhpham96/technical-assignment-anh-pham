//
//  HomeView.swift
//  TechnicalAssignment
//
//  Created by Pham Nguyen Nhat Anh on 26/3/25.
//

import SwiftUI
import CoreUI
struct HomeView: View {
    
    @EnvironmentObject var navigator: AppNavigator
    @State private var selectedImage: UIImage? = UIImage(resource: .example)
    
    var body: some View {
        VStack {
            Spacer()
            Text("app.title".localized)
                .font(.largeTitle)
                .bold()
            Spacer()
            navigationButtons
            Spacer()
        }
    }
    
    var navigationButtons: some View {
        VStack {
            if let image = selectedImage {
                let routes: [AppRoute] = [
                    .canvas(image: image),
                    .photoEdit(image: image)
                ]
                
                ForEach(routes, id: \.self) { route in
                    Button(route.viewName) {
                        navigator.goTo(route: route)
                    }.buttonStyle(CoreUICustomButtonStyle(backgroundColor: .orange))
                }
            }
        }
    }
}

#Preview {
    AppNavigationView()
}
