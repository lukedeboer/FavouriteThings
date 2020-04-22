import SwiftUI

    
    /**
     This  is the initial view users will see when they open the app. .
     
     */
    struct MasterView: View {
        
        @ObservedObject var viewModel: ViewModel
        @Environment(\.editMode) var mode
        
        var body: some View {
            
            VStack {
                if mode?.wrappedValue == .active {
                    HStack {
                        
                        TextField("Enter Navbar Title", text: $viewModel.listTitle).font(Font.system(.largeTitle).bold())
                    }
                }
                
                List {
                    ForEach(viewModel.people) { Thing in
                        NavigationLink(destination: DetailView(model: Thing, viewModel: self.viewModel)) {
                            Section {
                                RowView(model: Thing)
                            }
                        }
                    }.onDelete { indices in
                        indices.forEach { self.viewModel.remove(index: $0) }
                    }.onMove { (indices, destination) in
                        self.viewModel.people.move(fromOffsets: indices, toOffset: destination)
                    }
                }
            }.navigationBarTitle(mode?.wrappedValue == .active
                ? "": viewModel.listTitle)
        }
    }

