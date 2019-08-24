//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Alex Rhodes on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var hasBeenAddedLabel: UILabel!
    
    var itemController: ItemController?
    
    var item: Item? {
        didSet {
            setViews()
        }
    }
    
    func setViews() {
        guard let item = item else {return}
        itemNameLabel.text = item.name
        hasBeenAddedLabel.text = item.hasBeenAdded ? "NOT ADDED" : "ADDED"
    }
}
