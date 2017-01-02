//
//  ViewController.swift
//  tippy
//
//  Created by John Law on 18/12/16.
//  Copyright © 2016 John Law. All rights reserved.
//

import UIKit

var tipPercentage = [0.18, 0.2, 0.25]

class ViewController: UIViewController {

    // Access UserDefaults
    let defaults = UserDefaults.standard

    let formatter = NumberFormatter()

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var resultView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Get a string value and provide a default string in the case the string is nil.
        let defaultTip = defaults.integer(forKey: "defaultTip")
        tipControl.selectedSegmentIndex = defaultTip
        billField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        formatter.numberStyle = .currency
        tipLabel.text = formatter.string(from: NSNumber(value: 0))
        totalLabel.text = formatter.string(from: NSNumber(value: 0))

        let firstTip = defaults.string(forKey: "firstTip") ?? "18"
        let secondTip = defaults.string(forKey: "secondTip") ?? "20"
        let thirdTip = defaults.string(forKey: "thirdTip") ?? "25"
        
        tipPercentage[0] = Double(firstTip)!/100
        tipPercentage[1] = Double(secondTip)!/100
        tipPercentage[2] = Double(thirdTip)!/100
        
        tipControl.setTitle(firstTip + "%", forSegmentAt: 0)
        tipControl.setTitle(secondTip + "%", forSegmentAt: 1)
        tipControl.setTitle(thirdTip + "%", forSegmentAt: 2)

        if (billField.text != "") {
            calculate()
        }
    }

    @IBAction func onTap(_ sender: Any) {
        // Force to view the keyboard
        view.endEditing(true)
    }

    @IBAction func calculateTip(_ sender: Any) {
        calculate()
    }
    
    func calculate() {
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentage[tipControl.selectedSegmentIndex]
        let total = bill + tip
        tipLabel.text = formatter.string(from: NSNumber(value: tip))
        totalLabel.text = formatter.string(from: NSNumber(value: total))
    }
    
    @IBAction func goBack(segue: UIStoryboardSegue) {
    }

    @IBAction func reset(_ sender: Any) {
        billField.text = ""
        calculate()
    }


}

