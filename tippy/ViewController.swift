//
//  ViewController.swift
//  tippy
//
//  Created by Mandy Wong on 12/18/16.
//  Copyright © 2016 John Law. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

}

