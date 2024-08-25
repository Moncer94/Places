//
//  CustomCoordinatesView.swift
//  Places
//
//  Created by Ahmed Moncer on 25/08/2024.
//

import SwiftUI

struct CustomCoordinatesView: View {
    @StateObject var viewModel = CustomCoordinatesViewModel()

    var body: some View {
        VStack(spacing: 20) {
            Text("Enter coordinates")
                .font(.title)
                .foregroundStyle(.yellow.gradient)

            TextField("Latitude", text: $viewModel.latitude)
                .keyboardType(.numbersAndPunctuation)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.center)
                .frame(width: 250)

            TextField("Longitude", text: $viewModel.longitude)
                .keyboardType(.numbersAndPunctuation)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.center)
                .frame(width: 250)

            Button(action: {
                viewModel.handleSubmit()
            }) {
                Text("Go!")
                    .frame(width: 200)
                    .font(.system(size: 18))
                    .padding()
                    .foregroundColor(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.white, lineWidth: 2)
                    )
            }
            .background(.yellow.gradient)
            .cornerRadius(25)
        }
    }
}

#Preview {
    CustomCoordinatesView()
}
