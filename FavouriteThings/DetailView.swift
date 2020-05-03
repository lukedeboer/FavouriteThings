import SwiftUI


struct DetailView: View{

    /**
     This view  is what the users will interact with when they click on one of the Things from the List View

     */
    ///Getting the context
    @Environment(\.managedObjectContext) var context
    ///Calling Thing and storing it in a variable called "model"
    @ObservedObject var model: Thing

    var body: some View {

        GeometryReader { geometry in
            VStack{




                ///Image of Character with Styling
                self.model.updateImage()
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 200, height:200)
                    .clipped()
                    .shadow(radius: 20)

                Spacer()
                    .frame(height: 15)

                TextField("Image URL", text: self.$model.imageURLStr)
                    
                    .font(.body).multilineTextAlignment(.center)




                ///Title of Character's First and last Name


                Spacer()
                    .frame(height:20)

                TextField(Thing.NameFiller, text: self.$model.nameStr)
                    .font(Font.system(size:35)).multilineTextAlignment(.center)



                //Spacer to seperate
                HStack  {

                    ///Has weight and Height and Threat Level Text on the left.
                    VStack (alignment: .trailing, spacing: 10){

                        TextField("Enter Label", text: self.$model.weightLabelStr)
                        .frame(width:60, height:20)




                        TextField("Enter Label", text: self.$model.heightLabelStr)
                        .frame(width:60, height:20)













                    }


                    VStack (alignment: .leading, spacing: 10){
                        ///Weight of thing
                        TextField("Enter Weight", text: self.$model.weightStr)
                            .font(.body).multilineTextAlignment(.center)
                            .frame(width:50, height:20)

                        ///Height of Thing
                        TextField("Enter Height", text: self.$model.heightStr)
                            .font(.body).multilineTextAlignment(.center)
                            .frame(width:50, height:20)



                    }
                }
                VStack{


                    ///Status Label
                    Spacer()
                        .frame(height:30)
                    TextField("Enter Label", text: self.$model.statusLabelStr)
                     .frame(width:50, height:20)


                    ///Status
                    TextField("Enter Status", text: self.$model.statusStr)
                        .font(Font.system(size:18))
                        .font(.body).multilineTextAlignment(.center)

                     
                    ///Notes Label
                    TextField("Enter Label", text: self.$model.notesLabelStr)
                        .padding(.top,20)
                        .font(.title)
                    .frame(width:80, height:20)
                    ///Notes
                    TextField("Enter Notes", text: self.$model.notesStr)
                        .font(.body).multilineTextAlignment(.center)
                        .padding(.top,15)




                }


            }
        }

    }}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
