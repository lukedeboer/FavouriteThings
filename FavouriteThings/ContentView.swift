import SwiftUI
struct ContentView: View {
    /**
    ContentView is passes the MasterView in to be displayed.
    */
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            MasterView(viewModel: viewModel)
                .navigationBarTitle(Text(viewModel.listTitle), displayMode: .inline)
                .navigationBarItems(
                    leading: EditButton(),
                    trailing: Button(
                        action: {
                            withAnimation { self.viewModel.add() }
                        }
                        
                    ) {
                    Image(systemName: "plus")
                    })
        }
    }
}
