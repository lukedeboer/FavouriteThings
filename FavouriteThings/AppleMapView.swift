//
//  AppleMapView.swift
//  FavouriteThings
//
//  Created by Luke De boer on 7/5/20.
//  Copyright © 2020 Luke De boer. All rights reserved.
//

import MapKit
import SwiftUI

struct MapView: UIViewRepresentable {
    @ObservedObject var viewModel: Place
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        mapView.delegate = viewModel
        return mapView
    }
    
    func updateUIView(_ mapView: MKMapView, context: Context) {
        guard !viewModel.isUpdating else { return }
        let region = MKCoordinateRegion(center: viewModel.coordinates, latitudinalMeters: 10_000, longitudinalMeters: 10_000)
        mapView.setRegion(region, animated: true)
    }
}
