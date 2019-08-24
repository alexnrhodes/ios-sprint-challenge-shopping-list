//
//  ItemController.swift
//  Shopping List
//
//  Created by Alex Rhodes on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ItemController {
    
    
    // MARK: - Update

    
    var items: [Item] = []
    
    let itemNames = ["APPLE", "GRAPES", "MILK", "MUFFIN", "POPCORN", "SODA", "STRAWBERRIES"]
    
    init() {
        loadFromPersistentStore()
        for name in itemNames {
            let item = Item(name: name)
            items.append(item)
        }
    }
    
    func updateHasSeen(foritem item: Item) {
        item.hasBeenAdded = !item.hasBeenAdded
        saveToPersistentStore()
    }
    
    func loadFromPersistentStore() {
        let fm = FileManager.default
        guard let url = shoppingListURL else {return}
        fm.fileExists(atPath: url.path)
        
        do {
            let decoder = PropertyListDecoder()
            let data = try Data(contentsOf: url)
            items = try decoder.decode([Item].self, from: data)
        } catch {
            print("Error loading book data: \(error)")
        }
    }
    
    func saveToPersistentStore() {
        guard let url = shoppingListURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(items)
            try data.write(to: url)
        } catch {
            print("Error loading book data: \(error)")
        }
    }
    
    private var shoppingListURL: URL? {
        let fm = FileManager.default
        guard let dir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        return dir.appendingPathComponent("items.plist")
        
    }
}
