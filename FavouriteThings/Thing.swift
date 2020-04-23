//
//  Thing.swift
//  //
//  Created by Luke De boer on 4/3/20.
//  Copyright © 2020 Luke De boer. All rights reserved.
//

import Foundation
import SwiftUI

/**
 Thing  Class with key properties created used to build cursed characters.
 
 */
class Thing: ObservableObject, Identifiable, Codable {
    
    var imageUrl = ""
    ///creating variables and applying type.
    @Published  var Name: String
    /// Integer Weight of Cursed Contact
   @Published var weight: Int
    /// Integer Height of Cursed Contact
   @Published var height: Int
    /// String status of Cursed Contact
   @Published var status: String
    /// String image of  Cursed Contact
    var image: String
    ///Published variable with UIImage conditonal
    @Published var cursedUIImage: UIImage?
    ///Published variable String for cursed notes set to empty.
    @Published var cursednotes: String = ""
    
    
    
    enum CodingKeys: String, CodingKey {
        
        case imageUrl
        case image
        case Name
        case weight
        case height
        case status
        case cursednotes
        
        
        
    }
    
    
  
    
    ///initialisation constructor
    init(Name: String,  weight: Int, height: Int, status: String, image:String, cursednotes: String) {
        self.Name = Name
        self.weight = weight
        self.height = height
        self.status = status
        self.image = image
        self.cursednotes = cursednotes
       
        
    }
    
    
    required init (from decoder: Decoder) throws {
          let container = try decoder.container(keyedBy:CodingKeys.self)
          
        
        
        imageUrl = try container.decode(String.self, forKey: .imageUrl)
        
        
        
          image = try
            container.decode(String.self, forKey:
                .image)
        
        Name = try
        container.decode(String.self, forKey:
            .Name)
        
        status = try
        container.decode(String.self, forKey:
            .status)
          
        cursednotes = try
        container.decode(String.self, forKey:
            .cursednotes)
        
        weight = try
        container.decode(Int.self, forKey:
            .weight)
        
        height = try
        container.decode(Int.self, forKey:
            .height)
        
        
        updateImage(imageURL: imageUrl)
        
        
        
      }
    
    
    
    func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy:CodingKeys.self)
        
        
        try container.encode(imageUrl, forKey: .imageUrl)
        
        try container.encode(image,
                                   forKey: .image)
        
        
        try container.encode(image,
                             forKey: .image)
        
        try container.encode(Name,
                             forKey: .Name)
        
        try container.encode(status,
                                    forKey: .status)
        
        try container.encode(cursednotes,
                                           forKey: .cursednotes)
        
        
        try container.encode(weight,
                                           forKey: .weight)
        
        try container.encode(height,
                                           forKey: .height)
    }
    
    ///This function allows us to update the image of the cursed contact
    func updateImage(imageURL: String){
        
        guard let url = URL(string: imageURL),
            let imageData = try? Data(contentsOf: url),
            let cursedUIImage = UIImage(data: imageData) else {
                self.cursedUIImage = nil
                return
        }
        self.cursedUIImage = cursedUIImage
        
        
    }
    ///this funciton allows us to get the image so we can return it.
    func getImage() -> Image {
        if let cursedUIImage = cursedUIImage{
            return Image(uiImage: cursedUIImage)
        }
        else{
            return Image(image)
            
        }
        
        
        
    }
}





