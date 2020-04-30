import SwiftUI
struct ContentView: View {
    /**
    ContentView is passes the MasterView in to be displayed.
    */
    
  @Environment(\.managedObjectContext) var context
        @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Things.listTitle, ascending: true)]) var things: FetchedResults<Things>
        
        var body: some View {
            NavigationView {
                
                /// Bringing in MasterView contents
                MasterView(things: things.first ?? Things(context: context))
                    .navigationBarItems(
                      
                        leading: EditButton(),
                        trailing: Button(
                            action: {
                                withAnimation {
                                    let thing = Thing(context: self.context)
                                    thing.thing = self.things.first
                                    try? self.context.save()
                                }
                            }
                            
                        ) {
                        Image(systemName: "plus")
                        })
            }
        }
    }
