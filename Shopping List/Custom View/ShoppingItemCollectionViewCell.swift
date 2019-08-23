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
            updateUserDefaultsView()
            setViews()
        }
    }
    
    func setViews() {
        guard let item = item else {return}
        imageView.image = item.image
        itemNameLabel.text = item.name
    }
    
    @IBAction func hasBeenAddedButtonTapped(_ sender: UIButton) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(sender.isSelected, forKey: .changHasBeenAdded)
    }
    
    
    // MARK: User defaults
    
    private func updateUserDefaultsView() {
        
        let userDefaults = UserDefaults.standard
        hasBeenAddedButton.isSelected = userDefaults.bool(forKey: .changHasBeenAdded)
        
        
        let userDefaultsValue = UserDefaults.standard.bool(forKey: .changHasBeenAdded)
        
        if userDefaultsValue == false {
            hasBeenAddedButton.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
            hasBeenAddedButton.layer.cornerRadius = 8
            hasBeenAddedButton.setTitleColor(.white, for: .normal)
            hasBeenAddedButton.setTitle("ADD ITEM", for: .normal)
        } else {
            hasBeenAddedButton.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            hasBeenAddedButton.layer.cornerRadius = 8
            hasBeenAddedButton.setTitle("IS IN YOUR CART", for: .selected)
            hasBeenAddedButton.setTitleColor(.white, for: .selected) }
    }
}
