//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Alex Rhodes on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct Item {
    var name: String
    var image: UIImage
    var hasBeenAdded: Bool
    
    init(name: String, image: UIImage, hasBeenAdded: Bool = false) {
        self.name = name
        self.image = image
        self.hasBeenAdded = hasBeenAdded
    }
}
