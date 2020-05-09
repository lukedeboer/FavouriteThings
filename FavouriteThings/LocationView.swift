//
//  LocationView.swift
//  FavouriteThings
//
//  Created by Luke De boer on 7/5/20.
//  Copyright © 2020 Luke De boer. All rights reserved.
//
import Foundation
import SwiftUI

struct LocationView: View {
    @ObservedObject var place = Place()
    
    var body: some View {
        VStack {
            MapView(viewModel: place)
            HStack {
                Text("Name:")
                TextField("Enter Name of Location", text: $place.name, onCommit: {
                    self.place.updateCoordinatesFromName()
                })
            }
            
            HStack {
                Text("Lat:")
                TextField("Enter Lat", text: $place.latitude)
            }
            
            HStack {
                Text("Long")
                TextField("Enter Long", text: $place.longitude)
            }
            
            Button("Update to") {
                self.place.updateNameFromCoordinates()
            }
            
            Divider()
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}
