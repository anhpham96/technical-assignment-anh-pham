//
//  AppNavigationView.swift
//  TechnicalAssignment
//
//  Created by Pham Nguyen Nhat Anh on 26/3/25.
//

import SwiftUI

struct AppNavigationView: View {
    @StateObject private var navigator = AppNavigator()

    var body: some View {
        NavigationStack(path: $navigator.path) {
            HomeView()
                .navigationDestination(for: AppRoute.self, destination: destinationView)
        }
        .environmentObject(navigator)
    }

    @ViewBuilder
    private func destinationView(for route: AppRoute) -> some View {
        switch route {
        case .canvas(let image):
            CanvasView(viewModel: CanvasViewModel(title: route.viewName, image: image))
        case .photoEdit(let image):
            PhotoEditView(viewModel: PhotoEditViewModel(title: route.viewName, inputImage: image))
        }
    }
}
