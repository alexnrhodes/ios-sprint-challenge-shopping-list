//
//  CheckoutViewController.swift
//  Shopping List
//
//  Created by Alex Rhodes on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CheckoutViewController: UIViewController {
    
    var itemController: ItemController?
    var item: Item?
    
    @IBOutlet weak var itemsInCartLabel: UILabel!
    @IBOutlet weak var customerNameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var checkoutButton: UIButton!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setViews()
    }
    
    func setViews() {
        let userDefaults = UserDefaults.standard.bool(forKey: .changHasBeenAdded)
        
        guard let itemController = itemController else {return}
        var itemCount = 0
        for item in itemController.items {
        if userDefaults == true {
            itemCount += 1
        }
        }
        
        itemsInCartLabel.text = "You currently have \(itemCount) item(s) in your cart."
        
    }
    
    @IBAction func checkoutButtonTapped(_ sender: UIButton) {
        guard let name = customerNameTextField.text,
            let address = addressTextField.text else {return}
        let alert = UIAlertController(title: "Hi, \(name)! We have recieved your order.", message: "Your order will be delivered to \(address) in one hour. Thank you for shopping with us!", preferredStyle: .alert)
        alert.addAction(.init(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
