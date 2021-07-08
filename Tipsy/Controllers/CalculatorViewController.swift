//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var tenButton: UIButton!
    @IBOutlet weak var twentyButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var amount = 0.0
    var tip: Tips = .ten
    var split = 2.0
    
    var tipsy: Tipsy?
    

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        unselectPercentButtons()
        sender.isSelected = true
        switch sender.titleLabel?.text {
        case "0%":
            tip = .zero
        case "10%":
            tip = .ten
        case "20%":
            tip = .twenty
        default:
            print("error")
        }
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        billTextField.endEditing(true)
        split = sender.value
        splitNumberLabel.text = String(Int(split))
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        amount = Double(billTextField.text!) ?? 0.0
        tipsy = Tipsy(bill: amount, tip: tip, split: split)
        
        self.performSegue(withIdentifier: "segueToResult", sender: self)
    }
    
    func unselectPercentButtons() {
        zeroButton.isSelected = false
        tenButton.isSelected = false
        twentyButton.isSelected = false

    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.result = tipsy?.result
            destinationVC.info = "Split between \(Int(split)) people, with \(Int(tip.rawValue * 100))% tip."
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}

