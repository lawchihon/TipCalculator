//
//  ViewController.swift
//  tippy
//
//  Created by John Law on 18/12/16.
//  Copyright © 2016 John Law. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Access UserDefaults
    let defaults = UserDefaults.standard

    let formatter = NumberFormatter()

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Get a string value and provide a default string in the case the string is nil.
        let defaultTip = defaults.integer(forKey: "defaultTip")
        tipControl.selectedSegmentIndex = defaultTip
        billField.becomeFirstResponder()

        formatter.numberStyle = .currency
        tipLabel.text = formatter.string(from: NSNumber(value: 0))
        totalLabel.text = formatter.string(from: NSNumber(value: 0))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        // Force to view the keyboard
        view.endEditing(true)
    }

    @IBAction func calculateTip(_ sender: Any) {
        let tipPercentage = [0.18, 0.2, 0.25]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentage[tipControl.selectedSegmentIndex]
        let total = bill + tip
        tipLabel.text = formatter.string(from: NSNumber(value: tip))
        totalLabel.text = formatter.string(from: NSNumber(value: total))
        //tipLabel.text = String(format: "$%.2f", tip)
        //totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func goBack(segue: UIStoryboardSegue) {
    }

}

