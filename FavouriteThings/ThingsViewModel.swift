//
//  ThingsViewModel.swift
//  FavouriteThings
//
//  Created by Luke De boer on 30/4/20.
//  Copyright © 2020 Luke De boer. All rights reserved.
//

import Foundation
import CoreData

/// Extension of Things
extension Things {
    /// Variable declared which stores the Thing Array.
    var entries: [Thing] {
        set {things = NSOrderedSet(array: newValue)}
        get {(things?.array as? [Thing]) ?? []}
    }
    ///Variable called title is declared that gets the listTitle from Coredata and stores it to the variable.
    var title: String {
        set(newTitle) { self.listTitle = newTitle }
        get { listTitle ?? "" }
    }
    
    
    
    
    
    func sortAlphabetically() {
        entries.sort()
    }
    
    func sortInReverseOrder() {
        entries.sort(by: (>))
    }
}
