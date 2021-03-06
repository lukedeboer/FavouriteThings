//
//  LineView.swift
//  FavouriteThings
//
//  Created by Luke De boer on 23/4/20.
//  Copyright © 2020 Luke De boer. All rights reserved.
//

import Foundation


import SwiftUI

struct LineView: View {
    
    @Environment(\.managedObjectContext) var context
    @ObservedObject var model: Thing

    
    var body: some View {
        
        HStack {
            /// Characters Image
            self.model.updateImage()
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                
            
            /// Characters Name
            Text(model.nameStr)
            
            //Threat Status
            Divider()
            
           // Text("Status:")
            Text(model.statusLabelStr)
            Text(model.statusStr)
            
            
            
    
        }
         
    }
}
