//
//  SceneDelegate.swift
//  Assignment1
//
//  Created by Luke De boer on 4/3/20.
//  Copyright © 2020 Luke De boer. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var viewModel = ViewModel()
    
    
    var character1 = Thing(Name: "Elmur" , weight: 200, height: 200, status: "reeeeeee", image: "elmo", cursednotes: "")
    
    
     var character2 = Thing(Name: "Timmy" , weight: 230, height: 200, status: "Hide", image: "dog", cursednotes: "")
    
    
     var character3 = Thing(Name: "James" , weight: 100, height: 200, status: "Please Run", image: "kitty", cursednotes: "")
    
    
   
    
    
    
    
   
//
   private let fileName = "characters.json"
//
    private let fileManager = FileManager.default
    
    lazy private var documentsDir: URL = {
               fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
       }()
       lazy private var fileURL = documentsDir.appendingPathComponent(fileName)
    
    
    
    
    
    
    
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        
        do {
                 let t = try Data(contentsOf: fileURL)
                 let decoder = JSONDecoder()
                 let decodedViewModel = try decoder.decode(ViewModel.self, from: t)
                 viewModel = decodedViewModel
             } catch {
                 print("Could not load \(fileURL.path): \(error)")
             }
        
        
        
        // Create the SwiftUI view that provides the window contents.
        
      
        if viewModel.people.count < 1{
            
            viewModel.add(thing: character1)
            viewModel.add(thing: character2)
            viewModel.add(thing: character3)
            
            
            
        }
        
        
        
        
        
        
        
        
        let contentView = ContentView(viewModel: viewModel)
//
//
//            ///Creating Characters
//            Thing(Name: "Elmur" , weight: 200, height: 200, status: "reeeeeee", image: "elmo"),
//
//            Thing(Name: "Matt" , weight: 200, height: 200, status: "Pls Run", image: "kitty"),
//
//            Thing(Name: "Jake" , weight: 200, height: 200, status: "Unknown", image: "dog")
//        ]))
        
        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
        do {
                  let json = JSONEncoder()
                  let data = try json.encode(viewModel)
                  try data.write(to: fileURL)
              } catch {
                  print("Could not write file \(fileURL.path): \(error)")
              }

    }
    
    
}

