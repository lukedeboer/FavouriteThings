//
//  SceneDelegate.swift
//  Assignment1
//
//  Created by Luke De boer on 4/3/20.
//  Copyright © 2020 Luke De boer. All rights reserved.
//
import CoreData
import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("No app delegate")
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        /// Storing default data
        
        let thingsArray: [Things] = [Things]()
        
        let thingsFetch: NSFetchRequest<Things> = Things.fetchRequest()
        
        let thingsSort: NSSortDescriptor = NSSortDescriptor(keyPath: \Things.listTitle, ascending: true)
        
        thingsFetch.sortDescriptors = [thingsSort]
        
        do {
            var thingsArray = try context.fetch(thingsFetch)
            let count = thingsArray.count
            
            if(count == 0) {
                if let things = NSEntityDescription.insertNewObject(forEntityName: "Things", into: context) as? Things {
                    things.listTitle = "Cursed Things"
                    thingsArray.append(things)
                    appDelegate.saveContext()
                    
                    var thing = Thing(context: context)
                    thing.name = "Elmur"
                    thing.imageURL = "https://i.picsum.photos/id/813/200/200.jpg"
                    thing.weight = 100
                    thing.height = 200
                    thing.status = "Deadly"
                    thing.notes = "Please Stay Away!"
                    things.addToThings(thing)
                    
                    thing = Thing(context: context)
                    thing.name = "Elmur"
                    thing.imageURL = "https://i.picsum.photos/id/813/200/200.jpg"
                    thing.weight = 100
                    thing.height = 200
                    thing.status = "Deadly"
                    thing.notes = "Please Stay Away!"
                    things.addToThings(thing)
                    
                  thing = Thing(context: context)
                    thing.name = "Elmur"
                    thing.imageURL = "https://i.picsum.photos/id/813/200/200.jpg"
                    thing.weight = 100
                    thing.height = 200
                    thing.status = "Deadly"
                    thing.notes = "Please Stay Away!"
                    things.addToThings(thing)
                    
                    appDelegate.saveContext()
                }
                
            }
            
        } catch {
            print("Fetch failed")
        }
        
        let contentView = ContentView().environment(\.managedObjectContext, context)
        
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
       
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError()
        }
        delegate.saveContext()
    }
}

