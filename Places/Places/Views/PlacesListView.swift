//
//  PlacesListView.swift
//  Places
//
//  Created by Ahmed Moncer on 23/08/2024.
//

import SwiftUI

struct PlacesListView: View {
    @StateObject var viewModel = PlacesListViewModel()

    var body: some View {
        NavigationStack {
            Group {
                VStack {
                    if (viewModel.isLoading) {
                        ProgressView()
                    } else if let _ = viewModel.error {
                        Text("No places to display")
                    }
                    else {
                        List(viewModel.places) { place in
                            PlaceView(place: place, onTapAction: { place in
                                viewModel.handlePlaceViewTab(with: place)
                            })
                        }
                        .listStyle(PlainListStyle())
                    }
                    Button(action: {
                        viewModel.showingCustomLocation = true
                    }) {
                        Text("Go to your location")
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
            }.toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Places")
                        .font(.custom("Lobster-Regular", size: 24))
                        .foregroundColor(.yellow)
                        .accessibilityAddTraits(.isHeader)
                }
            }
        }
        .task {
            await viewModel.loadDPlaces()
        }
        .sheet(isPresented: $viewModel.showingCustomLocation, content: {
            CustomCoordinatesView()
        })
    }
}

struct PlaceView: View {
    let place: Place
    let onTapAction: (Place) -> Void
    var body: some View {
        HStack {
            Text(place.name)
        }.onTapGesture {
            onTapAction(place)
        }
    }
}
