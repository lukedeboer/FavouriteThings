//
//  ThingViewModel.swift
//  FavouriteThings
//
//  Created by Luke De boer on 30/4/20.
//  Copyright © 2020 Luke De boer. All rights reserved.
//

import Foundation
import CoreData
import SwiftUI

extension Thing {
    
    
     ///Creating title for name
    static var nameTitle: String = "Name"
     ///Creating Title for Weight
    static var weightTitle: String = "Weight"
     
     ///Creating Title for Height
    static var heightTitle: String  = "Height"
     ///Creating Title for Notes
    static var notesTitle: String = "Notes"
     ///Creating Title for Image URL
    static var imageUrlTitle: String = "Image URL"
     ///Creating Title for Status
    static var statusTitle: String = "Status"
     
     
     
   
     /// The filller text when the user enters the name
     static var NameFiller: String = "Enter Name"
     /// The fillter text when the user enters the weight
     static var weightFiller: String = "Enter Weight"
     /// The fillter text when the user enters the height
     static var heightFiller: String = "Enter Height"
     /// The fillter text when the user enters the status
     static var threatFiller: String = "Enter Threat Status"
     /// The fillter text when the user enters the URL of an image
     static var imageUrlPlaceholder: String = "URL Image"
     /// The fillter text when the user enters the notes for the cursed contact
     static var notesFiller: String = "Enter Notes"

    
    
    
    
    var nameStr: String {
        get { name ?? "" }
        set { name = newValue }
        
    }
    
    var imageNameStr: String {
        
        get {imageName ?? ""}
        set {imageName = newValue}
    
        
    }
    
    var imageURLStr: String {
        
        get {imageURL ?? ""}
        set {imageURL = newValue}
        
    }
    
    var weightLabelStr: String {
        
        get { weightLabel ?? "" }
        set { weightLabel = newValue }
        
    }
    
    var weightInt: Int {
        
        get { Int(weight ?? 0)}
        set {weight = Int64(newValue)}
        
    }
    
    
    var heightInt: Int {
           
           get { Int(height ?? 0)}
           set {height = Int64(newValue)}
           
       }
    
    var heightLabelStr: String {
        get { heightLabel ?? "" }
        set { heightLabel = newValue }
        
        
        
    }
    
    var statusStr: String {
        get { status ?? "" }
        set { status = newValue }
        
    }
    
    var statusLabelStr: String {
        
        
        get { statusLabel ?? "" }
        set { statusLabel = newValue }
    }
    
    var notesLabelStr: String {
        
        
        get { notesLabel ?? ""}
        set { notesLabel = newValue }
    }
    
    
    var notesStr: String {
        
        get { notes ?? ""}
              set { notes = newValue }
        
    }
    
    func updateImage() -> Image {
        guard let imageURL = imageURL,
            let url = URL(string: imageURL),
            let imageData = try? Data(contentsOf: url),
            let uiImage = UIImage(data: imageData) else {
                return Image(imageName ?? "cursed")
            }
        return Image(uiImage: uiImage)
    }
    
}
