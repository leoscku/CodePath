//
//  SettingsViewController.swift
//  Tip Calculator
//
//  Created by Leo Ku on 11/26/18.
//  Copyright © 2018 Shih-Chuan Leo Ku. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

  @IBOutlet weak var tipControl: UISegmentedControl!
  @IBOutlet weak var tipSlider: UISlider!
  @IBOutlet weak var sliderLabel: UILabel!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()

    self.title = "Settings"
    
    tipSlider.minimumValue = 0
    tipSlider.maximumValue = 50
    tipSlider.value = 18;
      
    let defaults = UserDefaults.standard
    
    tipControl.selectedSegmentIndex = defaults.integer(forKey: "segmentIndex")
    if (tipControl.selectedSegmentIndex == 0) {
      tipSlider.value = 18
    } else {
      tipSlider.value = defaults.float(forKey: "sliderValue")
    }
    sliderLabel.text = String(format: "%.0f%%", (tipSlider.value.rounded()))
    
    if (tipControl.selectedSegmentIndex != 3) {
      tipSlider.isEnabled = false
    } else {
      tipSlider.isEnabled = true
    }
    
        // Do any additional setup after loading the view.
    }
    

  @IBAction func updateDefault(_ sender: Any) {
    
    let defaults = UserDefaults.standard
    
    if (tipControl.selectedSegmentIndex != 3) {
      let tipPercentages = [0.18, 0.2, 0.25]
      tipSlider.isEnabled = false
      
      tipSlider.value = Float(tipPercentages[tipControl.selectedSegmentIndex] * 100)
      
      sliderLabel.text = String(format: "%.0f%%", tipPercentages[tipControl.selectedSegmentIndex] * 100)
      
    } else {
      
      tipSlider.isEnabled = true
      
      sliderLabel.text = String(format: "%.0f%%", (tipSlider.value.rounded()))
    }
    
    defaults.set(tipControl.selectedSegmentIndex, forKey: "segmentIndex")
    defaults.set(tipSlider.value, forKey: "sliderValue")
    defaults.synchronize()
  }
  /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
