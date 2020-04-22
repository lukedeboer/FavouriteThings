

import SwiftUI

struct ListView: View {
    
    @ObservedObject var model: Thing
    
    
    var body: some View {
        
        HStack {
            self.model.getImage().resizable().frame(width: 50, height: 50).clipShape(Circle()).scaledToFit()
            
            Text(model.Name).frame(width: 50)
            
            
            Spacer(minLength: 20)
            Text("Status: " + model.status).padding(.leading).frame(height: 50, alignment: .trailing)
            
        }
        
    }
}
