
import Foundation
/**
 This ViewModel model is used to create placeholder text for the Textfields in the DetailView.
 It also contains functins that control the adding and removal of cursed contacts.
 */
class ViewModel: ObservableObject, Identifiable, Codable {
    
    ///Creating a listview title.
    static var listTitle: String = "Cursed Contacts"
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
    ///This is declcaring the array of cursed contacts
    @Published var people: [Thing]
    
    
    
    
    ///This function handles the adding of a contact by setting all of variables called in the text fields to empty or 0.
    func add() {
        people.insert(Thing(Name: "", weight: 0, height: 0, status: "", image: ""), at: 0)
        
        
    }
    /// This function handles the deletion of a contact from list view.
    func remove(index: Int){
        people.remove(at: index)
        
        
        
        enum CodingKeys: String, CodingKey {
            
            
            case Name
            case weight
            case height
            case status
            case image
            
            
            
        }
        
        
        
        
        
    }
    ///constructing the listTitle and people array.
    init (listTitle: String, people: [Thing]){
        self.people = people
        
    }
    
}
