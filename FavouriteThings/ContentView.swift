import SwiftUI
struct ContentView: View {
    /**
    ContentView is passes the MasterView in to be displayed.
    */
    ///Getting context
  @Environment(\.managedObjectContext) var context
    
    ///Fetch Request of listTitle and Things
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
                                    ///Adding a new Thing and saving it
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
