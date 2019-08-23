//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Alex Rhodes on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ItemCell"

class ShoppingListCollectionViewController: UICollectionViewController {
    
    var itemController = ItemController()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
        setViews()
    }
    
    func setViews() {
        let userDefaults = UserDefaults.standard
    }

  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "" {
            guard let checkoutVC = segue.destination as? CheckoutViewController else {return}
            checkoutVC.itemController = itemController
        }
    }
  

    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemController.items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ShoppingItemCollectionViewCell else {return UICollectionViewCell()}
    
        cell.item = itemController.items[indexPath.row]
        
    
        return cell
    }
}
