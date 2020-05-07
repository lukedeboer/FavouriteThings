import SwiftUI

    
    /**
     This  is the initial view users will see when they open the app. .
      We pass through the LineView
     */
    struct MasterView: View {
        ///Getting the context
        @Environment(\.managedObjectContext) var context
        ///Calling Things and storing it in a variable thing
        @ObservedObject var things: Things
        ///Getting the edit mode
         @Environment(\.editMode) var mode


        var body: some View {
            ///If edit mode is selected, show this V- Stack.
            VStack {
                if mode?.wrappedValue == .active {
                    HStack {
                        
                        TextField("Enter Navbar Title", text: self.$things.title).font(Font.system(.largeTitle).bold())
                    }
                }
                
                
                HStack {
                              Spacer()
                              Button("Sort A-Z") {
                                  self.things.sortAlphabetically()
                              }.foregroundColor(.black)
                              
                               Spacer()
                              Button("Sort Z-A") {
                                  self.things.sortInReverseOrder()
                              }.foregroundColor(.black)
                              
                              Spacer()
                    
                          }
                
                
                List {
                    ForEach(things.entries, id: \.self) { thing in
                    NavigationLink(destination: DetailView(model: thing)) {
                        Section {
                            LineView(model: thing)
                            }
                        }
                        ///Deleting a Thing from list
                    }.onDelete { indices in
                        indices.forEach { self.things.removeFromThings(at: $0) }
                        ///Moving thing in list
                    }.onMove { (indices, destination) in
                   self.things.entries.move(fromOffsets: indices, toOffset: destination)
                    }
                }
                ///Here is our navbar  title
            }.navigationBarTitle(mode?.wrappedValue == .active
                ? "": things.listTitle ?? "")
        }
    }

