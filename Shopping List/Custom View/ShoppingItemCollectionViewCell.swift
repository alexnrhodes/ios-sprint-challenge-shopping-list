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
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//                updateUserDefaultsView()
//    }
    
    var item: Item? {
        didSet {
//        updateUserDefaultsView()
            setViews()
        }
    }
    
    func setViews() {
        guard let item = item else {return}
        imageView.image = item.image
        itemNameLabel.text = item.name
        
        
        
        hasBeenAddedButton.layer.masksToBounds = true
        hasBeenAddedButton.tintColor = #colorLiteral(red: 0.9990584254, green: 0, blue: 0.3153140545, alpha: 1)
        hasBeenAddedButton.backgroundColor = #colorLiteral(red: 0.9990584254, green: 0, blue: 0.3153140545, alpha: 1)
        hasBeenAddedButton.layer.cornerRadius = 8
        hasBeenAddedButton.setTitleColor(.white, for: .normal)
        hasBeenAddedButton.setTitle("ADD ITEM", for: .normal)
    }
    
    @IBAction func hasBeenAddedButtonTapped(_ sender: UIButton) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(sender.isSelected, forKey: .changHasBeenAdded)
        
        updateUserDefaultsView()
        
        
    }
    
    
    
    
    // MARK: User defaults
    
    private func updateUserDefaultsView() {
        let userDefaults = UserDefaults.standard
        hasBeenAddedButton.isSelected = userDefaults.bool(forKey: .changHasBeenAdded)
        
        let userDefaultsValue = UserDefaults.standard.bool(forKey: .changHasBeenAdded)
        
        if userDefaultsValue == false {
            hasBeenAddedButton.layer.masksToBounds = true
            hasBeenAddedButton.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0.3141315877, alpha: 1)
            hasBeenAddedButton.tintColor = #colorLiteral(red: 0.9990584254, green: 0, blue: 0.3153140545, alpha: 1)
            hasBeenAddedButton.layer.cornerRadius = 8
            hasBeenAddedButton.setTitleColor(.white, for: .normal)
            hasBeenAddedButton.setTitle("ADD ITEM", for: .normal)
        } else {
            hasBeenAddedButton.layer.masksToBounds = true
            hasBeenAddedButton.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            hasBeenAddedButton.tintColor = #colorLiteral(red: 0.2553634048, green: 0.2747430503, blue: 0.3004937768, alpha: 1)
            hasBeenAddedButton.layer.cornerRadius = 8
            hasBeenAddedButton.setTitle("IS IN YOUR CART", for: .selected)
            hasBeenAddedButton.setTitleColor(.white, for: .selected) }
        
    }
}
