import SwiftUI


struct DetailView: View{
    
    /**
     This view  is what the users will interact with when they click on one of the cursed contacts from the List View
     
     */
    
    @ObservedObject var model: Thing
    @ObservedObject var viewModel: ViewModel
    @State public var notes: String = ""
    @State var url: String = ""
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack{
                
                
                
                
                ///Image of Character with Styling
                self.model.getImage()
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 200, height:200)
                    .clipped()
                    .shadow(radius: 20)
                
                Spacer()
                    .frame(height: 15)
                
                TextField("Image URL", text: self.$model.imageUrl) {
                    self.model.updateImage(imageURL: self.model.imageUrl)}
                    .font(.body).multilineTextAlignment(.center)
                
                
                
                
                ///Title of Character's First and last Name
                
                
                Spacer()
                    .frame(height:20)
                
                TextField(ViewModel.NameFiller, text:  self.$model.Name)
                    .font(Font.system(size:35)).multilineTextAlignment(.center)
                
                
                
                //Spacer to seperate
                HStack  {
                    
                    ///Has weight and Height and Threat Level Text on the left.
                    VStack (alignment: .trailing, spacing: 10){
                        
                        TextField("Enter Label", text: self.$viewModel.weightTitle)
                        
                        
                        
                        
                         TextField("Enter Label", text: self.$viewModel.heightTitle)
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                    }
                    
                    
                    VStack (alignment: .leading, spacing: 10){
                        
                        TextField(ViewModel.weightFiller, value: self.$model.weight, formatter: NumberFormatter())
                            .font(.body).multilineTextAlignment(.center)
                            .frame(width:50, height:20)
                        
                        
                        TextField(ViewModel.heightFiller, value: self.$model.height, formatter: NumberFormatter())
                            .font(.body).multilineTextAlignment(.center)
                            .frame(width:50, height:20)
                        
                        
                        
                    }
                }
                VStack{
                    
                    
                    
                    Spacer()
                        .frame(height:30)
                      TextField("Enter Label", text: self.$viewModel.statusTitle)
                                            TextField(ViewModel.threatFiller, text:  self.$model.status)
                        .font(Font.system(size:18))
                        .font(.body).multilineTextAlignment(.center)
                    
                    
                      TextField("Enter Label", text: self.$viewModel.notesTitle)
                        .padding(.top,20)
                        .font(.title)
                    TextField(ViewModel.notesFiller, text: self.$model.cursednotes)
                        .font(.body).multilineTextAlignment(.center)
                        .padding(.bottom,20)
                    
                    
                    
                    
                }
                
                
            }
        }
        
    }}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
