import SwiftUI

    
    /**
     This  is the initial view users will see when they open the app. .
     
     */
    struct MasterView: View {
        @Environment(\.managedObjectContext) var context
        @ObservedObject var things: Things
        
         @Environment(\.editMode) var mode


        var body: some View {
            ///If edit mode is selected, show this V- Stack.
            VStack {
                if mode?.wrappedValue == .active {
                    HStack {
                        
                        TextField("Enter Navbar Title", text: self.$things.title).font(Font.system(.largeTitle).bold())
                    }
                }
                
                List {
                    ForEach(things.entries, id: \.self) { thing in
                    NavigationLink(destination: DetailView(model: thing)) {
                        Section {
                            LineView(model: thing)
                            }
                        }
                    }.onDelete { indices in
                        indices.forEach { self.things.removeFromThings(at: $0) }
                    }.onMove { (indices, destination) in
                   self.things.entries.move(fromOffsets: indices, toOffset: destination)
                    }
                }
            }.navigationBarTitle(mode?.wrappedValue == .active
                ? "": things.listTitle ?? "")
        }
    }

