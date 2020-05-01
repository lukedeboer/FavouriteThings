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

    
    
    
    /// Declared nameStr variable that gets name value from Coredata and stores it.
    var nameStr: String {
        get { name ?? "" }
        set { name = newValue }
        
    }
    /// Declared imageNameStr variable that gets imageName value from CoreData and Stores it
    var imageNameStr: String {
        
        get {imageName ?? ""}
        set {imageName = newValue}
    
        
    }
    /// Declared imageURLStr variable that gets the imageURL value from CoreData and Stores it.
    var imageURLStr: String {
        
        get {imageURL ?? ""}
        set {imageURL = newValue}
        
    }
    /// Declared weightLabelStr  variable that gets the weightLabel value from CoreData and Stores it.
    var weightLabelStr: String {
        
        get { weightLabel ?? "" }
        set { weightLabel = newValue }
        
    }
    /// Declared weightInt variable that is an Integer type and gets the weight value from CoreData and Stores it.
    var weightInt: Int {
        
        get { Int(weight ?? 0)}
        set {weight = Int64(newValue)}
        
    }
    
    /// Declared heightInt variable that is an Integer type and gets the height value from CoreData and Stores it.
    var heightInt: Int {
           
           get { Int(height ?? 0)}
           set {height = Int64(newValue)}
           
       }
    /// Declared heightLabelStr variable that gets the heightLabel value from CoreData and stores it.
    var heightLabelStr: String {
        get { heightLabel ?? "" }
        set { heightLabel = newValue }
        
        
        
    }
    
    /// Declared statusStr variable that gets the status value from CoreData and stores it.
    var statusStr: String {
        get { status ?? "" }
        set { status = newValue }
        
    }
    
    /// Declared statusLabelStr variable that gets the statusLabel value from CoreData and stores it.
    var statusLabelStr: String {
        
        
        get { statusLabel ?? "" }
        set { statusLabel = newValue }
    }
    /// Declared notesLabelStr variable that gets the notesLabel value from CoreData and Stores it.
    var notesLabelStr: String {
        
        
        get { notesLabel ?? ""}
        set { notesLabel = newValue }
    }
    
    //// Declared notesStr variable that gets the notes value from CoreData and Stores it.
    var notesStr: String {
        
        get { notes ?? ""}
              set { notes = newValue }
        
    }
    ///UpdateImage function declared that updates the image and also returns the image.
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
