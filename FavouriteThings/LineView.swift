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
    
    @ObservedObject var model: Thing
    @ObservedObject var viewModel: ViewModel

    
    var body: some View {
        
        HStack {
            /// Characters Image
            self.model.getImage()
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                
            
            /// Characters Name
            Text(model.Name)
            
            //Threat Status
            Divider()
            
           // Text("Status:")
            Text(viewModel.statusTitle)
            Text(model.status)
            
            
            
    
        }
         
    }
}
