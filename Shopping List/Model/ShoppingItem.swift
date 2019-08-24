//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Alex Rhodes on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class Item: Codable {
    var name: String
    var hasBeenAdded: Bool
    
    init(name: String, hasBeenAdded: Bool = false) {
        self.name = name
        self.hasBeenAdded = hasBeenAdded
    }
}


