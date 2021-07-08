//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Vladimir Khrolovich on 8.07.21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    var result: String?
    var info: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = result ?? "errror"
        infoLabel.text = info ?? "ERROR"
    }
    

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
