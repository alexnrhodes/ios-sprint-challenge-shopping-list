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

    @IBOutlet weak var itemsInCartLabel: UILabel!
    @IBOutlet weak var customerNameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var checkoutButton: UIButton!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
   
    }
    
    func setViews() {
    
    }
    
    @IBAction func checkoutButtonTapped(_ sender: UIButton) {
        //Alert
    }
}
