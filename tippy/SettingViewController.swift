//
//  SettingViewController.swift
//  tippy
//
//  Created by John Law on 28/12/2016.
//  Copyright © 2016 John Law. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    
    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    @IBOutlet weak var firstTipField: UITextField!
    @IBOutlet weak var secondTipField: UITextField!
    @IBOutlet weak var thirdTipField: UITextField!

    let defaults = UserDefaults.standard
    var firstTip = "0"
    var secondTip = "0"
    var thirdTip = "0"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        defaultTipControl.selectedSegmentIndex = defaults.integer(forKey: "defaultTip")

        firstTip = defaults.string(forKey: "firstTip") ?? "18"
        secondTip = defaults.string(forKey: "secondTip") ?? "20"
        thirdTip = defaults.string(forKey: "thirdTip") ?? "25"
        
        updateFirstTip()
        updateSecondTip()
        updateThirdTip()

        firstTipField.text = firstTip
        secondTipField.text = secondTip
        thirdTipField.text = thirdTip
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func updateFirstTip() {
        defaultTipControl.setTitle(firstTip + "%", forSegmentAt: 0)
    }

    func updateSecondTip() {
        defaultTipControl.setTitle(secondTip + "%", forSegmentAt: 1)
    }

    func updateThirdTip() {
        defaultTipControl.setTitle(thirdTip + "%", forSegmentAt: 2)
    }

    @IBAction func editFirstTip(_ sender: Any) {
        if (firstTipField.hasText) {
            firstTip = firstTipField.text!
        }
        else {
            firstTip = "0"
        }
        updateFirstTip()
    }

    @IBAction func editSecondTip(_ sender: Any) {
        if (secondTipField.hasText) {
            secondTip = secondTipField.text!
        }
        else {
            secondTip = "0"
        }
        updateSecondTip()
    }

    @IBAction func editThirdTip(_ sender: Any) {
        if (thirdTipField.hasText) {
            thirdTip = thirdTipField.text!
        }
        else {
            thirdTip = "0"
        }
        updateThirdTip()
    }

    @IBAction func save(_ sender: Any) {
        if (Double(firstTip) == nil) {
            // Create alert controller
            let alert = UIAlertController(title: "Invalid Input", message: "First default tips", preferredStyle: UIAlertControllerStyle.alert)
            
            // Add button for alert
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            // Show the alert
            self.present(alert, animated: true, completion: nil)
        }
        else if (Double(secondTip) == nil) {
            // Create alert controller
            let alert = UIAlertController(title: "Invalid Input", message: "Second default tips", preferredStyle: UIAlertControllerStyle.alert)
            
            // Add button for alert
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            // Show the alert
            self.present(alert, animated: true, completion: nil)
        }
        else if (Double(thirdTip) == nil) {
            // Create alert controller
            let alert = UIAlertController(title: "Invalid Input", message: "Third default tips", preferredStyle: UIAlertControllerStyle.alert)
            
            // Add button for alert
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            // Show the alert
            self.present(alert, animated: true, completion: nil)
        }
        else {
            defaults.set(defaultTipControl.selectedSegmentIndex, forKey: "defaultTip")

            defaults.set(firstTip, forKey: "firstTip")
            defaults.set(secondTip, forKey: "secondTip")
            defaults.set(thirdTip, forKey: "thirdTip")
            defaults.synchronize()
            
            // Create alert controller
            let alert = UIAlertController(title: "Saved", message: "", preferredStyle: UIAlertControllerStyle.alert)
            
            // Add button for alert
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            // Show the alert
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func onTap(_ sender: Any) {
        // Force to view the keyboard
        view.endEditing(true)
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
