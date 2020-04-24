
import Foundation
/**
 This ViewModel model is used to create placeholder text for the Textfields in the DetailView.
 It also contains functoins that control the adding and removal of Things.
 */
class ViewModel: ObservableObject, Identifiable, Codable {
    
    
    ///Creating title for name
    @Published var nameTitle = "Name"
    ///Creating Title for Weight
    @Published var weightTitle = "Weight"
    
    ///Creating Title for Height
    @Published var heightTitle  = "Height"
    ///Creating Title for Notes
    @Published var notesTitle = "Notes"
    ///Creating Title for Image URL
    @Published var imageUrlTitle = "Image URL"
    ///Creating Title for Status
    @Published var statusTitle = "Status"
    
    
    
    ///Creating a listview title.
   @Published var listTitle: String = "Favourite Things"
    /// The filller text when the user enters the name
    static var NameFiller: String = "Enter Name"
    /// The fillter text when the user enters the weight
    static var weightFiller: String = "Enter Weight"
    /// The fillter text when the user enters the height
    static var heightFiller: String = "Enter Height"
    /// The fillter text when the user enters the status
    static var threatFiller: String = "Enter Threat Status"
    /// The fillter text when the user enters the URL of an image
    static var imageUrlPlaceholder: String = "URL Image"
    /// The fillter text when the user enters the notes for the cursed contact
    static var notesFiller: String = "Enter Notes"
    ///This is declcaring the array of  Things
    @Published var people: [Thing]
    
    
    
    
    ///This function handles the adding of a contact by setting all of variables called in the text fields to empty or 0.
    func add(thing: Thing) {
        people.insert(thing, at: 0)
        
        
    }
    /// This function handles the deletion of a contact from list view.
    func remove(index: Int){
        people.remove(at: index)
        
        
       
        
        
        
        
        
    }
    ///Creating cases for codable types

               enum CodingKeys: String, CodingKey {
               
               case people
               case listTitle
               case nameTitle
               case heightTitle
               case weightTitle
               case notesTitle
               case imageUrlTitle
               case statusTitle
               
               
               
           }
    ///constructing the listTitle and people array.
    init() {
         people = [Thing]()
     }
     
    
    
    
    
    ///Constructor for  Decoder
    required init (from decoder: Decoder) throws {
        
        
       let container = try decoder.container(keyedBy: CodingKeys.self)
        
        people = try
            container.decode([Thing].self,
                             forKey:.people)
        listTitle = try container.decode(String.self,
                                         forKey: .listTitle)
        
        nameTitle = try container.decode(String.self,
                                                forKey: .nameTitle)
        
        heightTitle = try container.decode(String.self,
                                                forKey: .heightTitle)
        
        weightTitle = try container.decode(String.self,
        forKey: .weightTitle)
        
        notesTitle = try container.decode(String.self,
                                                forKey: .notesTitle)
        
        imageUrlTitle = try container.decode(String.self,
                                             forKey: .imageUrlTitle)
        
        statusTitle = try container.decode(String.self,
        forKey: .statusTitle)
        
        
        
        
        
        
    }
        /// viewModel  being encoded using the encode function.
        func encode (to encoder: Encoder) throws {
        
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(people, forKey: .people)
        
        try container.encode(listTitle, forKey: .listTitle)
        
        try container.encode(nameTitle, forKey: .nameTitle)
        
        try container.encode(heightTitle, forKey: .heightTitle)
        
        try container.encode(weightTitle, forKey: .weightTitle)
        
        try container.encode(notesTitle, forKey: .notesTitle)
        
        try container.encode(imageUrlTitle, forKey: .imageUrlTitle)
        
        try container.encode(statusTitle, forKey: .statusTitle)
        
        
    }
    
    
    
    
    
    
}
