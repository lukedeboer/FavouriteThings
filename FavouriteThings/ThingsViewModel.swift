//
//  ThingsViewModel.swift
//  FavouriteThings
//
//  Created by Luke De boer on 30/4/20.
//  Copyright © 2020 Luke De boer. All rights reserved.
//

import Foundation
import CoreData


extension Things {
    
    var entries: [Thing] {
        set {things = NSOrderedSet(array: newValue)}
        get {(things?.array as? [Thing]) ?? []}
    }
    
    var title: String {
        set(newTitle) { self.listTitle = newTitle }
        get { listTitle ?? "" }
    }
}
