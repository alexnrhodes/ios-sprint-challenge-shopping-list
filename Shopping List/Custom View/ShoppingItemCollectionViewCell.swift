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
    @IBOutlet weak var hasBeenAddedButton: UIButton!
    @IBOutlet weak var itemNameLabel: UILabel!
    
    var item: Item? {
        didSet {
            
        }
    }
    
    func setViews() {
        
    }
    
    @IBAction func hasBeenAddedButtonTapped(_ sender: UIButton) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(sender.isSelected, forKey: .changHasBeenAdded)
    }
    
}
