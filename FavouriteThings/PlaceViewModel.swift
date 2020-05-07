//
//  PlaceViewModel.swift
//  FavouriteThings
//
//  Created by Luke De boer on 7/5/20.
//  Copyright © 2020 Luke De boer. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit

@objc class Place: NSObject, Identifiable,
ObservableObject {
    
    @Published var coordinates =
        CLLocationCoordinate2D(latitude: -40.000,
                               longitude: 130.211)
    @Published var name = ""
    
    var isUpdating  = false
    var latitude: String {
        
        get {"\(coordinates.latitude)"}
        set {
            guard let coordin = CLLocationDegrees(newValue)
                else { return }
            coordinates.latitude = coordin
            
        }
        
    
        
    }
    
    var longitude: String {
        
        get {"\(coordinates.longitude)"}
        set {
            guard let coordin = CLLocationDegrees(newValue)
                else { return }
            coordinates.longitude = coordin
            
            
        }
        
    }
    
    func updateCoordinatesFromName(){
        
        let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(name) {
            
            (possPlaceMarks, possError) in
            guard let placemark = possPlaceMarks?.first,
                let location = placemark.location else {
                    
                    let description: String
                    if let error = possError {
                        
                        description = "\(error)"
                        
                    }
                    
                    else{
                        description = "Unknown Error Has Occured"
                        
                    }
                    print ("Error Occured: \(description)")
                    return
            }
            
            self.coordinates = location.coordinate
        }
    }
    
    
    
     func updateNameFromCoordinates() {
            let geocoder = CLGeocoder()
            let location = CLLocation(latitude: coordinates.latitude, longitude: coordinates.longitude)
            geocoder.reverseGeocodeLocation(location) { (possPlaceMarks, possError) in
                guard let placemark = possPlaceMarks?.first else {
                    let description: String
                    if let error = possError {
                        description = "\(error)"
                    } else {
                        description = "Unknown Error has Occured"
                    }
                    
                    print("Error Occured: \(description)")
                    return
                }
                self.name = placemark.name ?? placemark.administrativeArea ?? placemark.locality ?? placemark.subLocality ?? placemark.thoroughfare ?? placemark.subThoroughfare ?? placemark.country ?? "Place Name is unknown"
            }
        }
    }
    
    
extension Place: MKMapViewDelegate {
    func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
        guard !isUpdating else {
            return
        }
        
        isUpdating = true
        let centre = mapView.centerCoordinate
        coordinates = centre
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .milliseconds(250)) {
            self.isUpdating = false
        }
    }
}
