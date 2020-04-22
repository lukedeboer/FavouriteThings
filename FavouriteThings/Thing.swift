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
class Thing: ObservableObject, Identifiable {
    ///creating variables and applying type.
    @Published  var Name: String
    /// Integer Weight of Cursed Contact
    var weight: Int
    /// Integer Height of Cursed Contact
    var height: Int
    /// String status of Cursed Contact
    var status: String
    /// String image of  Cursed Contact
    var image: String
    ///Published variable with UIImage conditonal
    @Published var cursedUIImage: UIImage?
    ///Published variable String for cursed notes set to empty.
    @Published var cursednotes: String = ""
    ///initialisation constructor
    init(Name: String,  weight: Int, height: Int, status: String, image:String) {
        self.Name = Name
        
        self.weight = weight
        self.height = height
        self.status = status
        self.image = image
        
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





