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
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CheckoutSegue" {
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
        
        switch indexPath.row {
        case 0:
            cell.imageView.image = UIImage(named: .apple)
        case 1:
            cell.imageView.image = UIImage(named: .grapes)
        case 2:
            cell.imageView.image = UIImage(named: .milk)
        case 3:
            cell.imageView.image = UIImage(named: .muffin)
        case 4:
            cell.imageView.image = UIImage(named: .popcorn)
        case 5:
            cell.imageView.image = UIImage(named: .soda)
        case 6:
            cell.imageView.image = UIImage(named: .strawberreis)
        default:
            return UICollectionViewCell()
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let item = itemController.items[indexPath.row]
        
        itemController.updateHasSeen(foritem: item)
        
        collectionView.reloadItems(at: [indexPath])
        
    }
}
