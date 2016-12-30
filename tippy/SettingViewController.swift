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
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let defaultTip = defaults.integer(forKey: "defaultTip")
        defaultTipControl.selectedSegmentIndex = defaultTip
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func save(_ sender: Any) {
        defaults.set(defaultTipControl.selectedSegmentIndex, forKey: "defaultTip")
        defaults.synchronize()

        // Create alert controller
        let alert = UIAlertController(title: "Saved", message: "", preferredStyle: UIAlertControllerStyle.alert)
        
        // Add button for alert
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        // Show the alert
        self.present(alert, animated: true, completion: nil)
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
