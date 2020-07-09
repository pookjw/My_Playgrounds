//
//  DetailViewController.swift
//  Practice_TableView
//
//  Created by pook on 7/9/20.
//  Copyright © 2020 jinwoopeter. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var text: String? = nil
    @IBOutlet weak var centerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        centerLabel.text = text
    }
}
