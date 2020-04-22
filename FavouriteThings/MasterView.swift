import SwiftUI

struct MasterView: View{
    
    /**
     This  is the initial view users will see when they open the app. .
     
     */
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.people) { Thing in
                NavigationLink(destination: DetailView(model: Thing , viewModel: self.viewModel)){
                    Section {
                        ListView(model: Thing)
                    }
                }
            }.onDelete { indices in
                indices.forEach { self.viewModel.remove(index: $0) }
            }
        }
    }
}

