//
//  FavouriteThingsTests.swift
//  FavouriteThingsTests
//
//  Created by Luke De boer on 22/4/20.
//  Copyright © 2020 Luke De boer. All rights reserved.
//

import XCTest
@testable import FavouriteThings

class FavouriteThingsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
  
    
    
    
    
    
    

    
   
    
    
    

  ///Creating object of ViewModel
  var viewModel = ViewModel()

    let Name = "Luigi"

    let weight = 300
    let height = 200
    let status = "High Risk"
   let image = "dog"
  @Published var cursednotes: String = ""
    

    
    
    
     ///find the user's documents directory

      private let fileName = "characters.json"
      private let fileManager = FileManager.default
        
      lazy private var documentsDir: URL = {
              fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
          }()
       lazy private var fileURL = documentsDir.appendingPathComponent(fileName)
        

    
    
    
    
    ///Testing FirstName
    func testName() {
        
       let person = Thing(Name: Name, weight: weight, height: height, status: status, image: image, cursednotes: cursednotes)
    
        
        XCTAssertEqual(person.Name, Name)
        XCTAssertNotNil(person.Name)

    
    }
    
    
    
    
    ///Testing Weight
    func testWeight(){
        
          let person = Thing(Name: Name, weight: weight, height: height, status: status, image: image, cursednotes: cursednotes)
               
        
        
        
        XCTAssertNotNil(person.weight)
        XCTAssertEqual(person.weight, weight)
        
        
        
    }
    
    
    
    ///Testing Height
    func testHeight(){
        
            let person = Thing(Name: Name, weight: weight, height: height, status: status, image: image, cursednotes: cursednotes)
               
        
        XCTAssertNotNil(person.height)
        XCTAssertEqual(person.height, height)
        
        
        
    }
    
    
    ///Testing Threat Status
    func testStatus(){
           
           let person = Thing(Name: Name, weight: weight, height: height, status: status, image: image, cursednotes: cursednotes)
           
           XCTAssertNotNil(person.status)
           XCTAssertEqual(person.status, status)
           
           
           
       }
    
    
    
    
    ///Testing Image
    func testImage(){
        
            let person = Thing(Name: Name, weight: weight, height: height, status: status, image: image, cursednotes: cursednotes)
        
        XCTAssertNotNil(person.image)
        XCTAssertEqual(person.image, image)
        
        
        
    }
    
    
    ///Testing Adding and removing Things
    func testAddRemoveViewModel() {

          let person1 = Thing(Name: Name, weight: weight, height: height, status: status, image: image, cursednotes: cursednotes)

        viewModel.add(thing: person1)

        XCTAssertEqual(viewModel.people.count, 1)



    }
    
    
    
    ///Testing the array of Things
    func testArray(){
           
            

           let people: [Thing] = [Thing(Name: "James", weight: 2, height: 2, status: "High", image: "dog", cursednotes: "")]
           
           XCTAssertEqual(people.count, 1)
           
           XCTAssert((people as Any) is [Thing])
           
           
           
       }
    
    
    ///Testing JSON File
   func testJSON(){
      
      
      let person1 = Thing(Name: Name, weight: weight, height: height, status: status, image: image, cursednotes: cursednotes)
       
        viewModel.add(thing: person1)
  
    do {
        
        let json = JSONEncoder()
        
        let data = try json.encode(viewModel)
        
        try data.write(to: fileURL)
        
        
    } catch {
        
        XCTFail("JSON ENCODING HAS FAILED!")
        
    }
    
    do {
        if let data = try? Data(contentsOf: fileURL){
            
            let decoder = JSONDecoder()
            
            let decodedViewModel = try decoder.decode(ViewModel.self, from: data)
            
            viewModel = decodedViewModel
            
            
        }
        
    }catch{
        
        XCTFail("JSON DECODING FAILED!")
        
    }
    XCTAssertEqual(viewModel.people.count, 1)
        
    }
    
    
    
    
    
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
    
    
    
    
    
    
    
    

