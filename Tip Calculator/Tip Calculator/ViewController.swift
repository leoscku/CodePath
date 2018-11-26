//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Leo Ku on 11/15/18.
//  Copyright © 2018 Shih-Chuan Leo Ku. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var tipLabel: UILabel!
  @IBOutlet weak var totalLabel: UILabel!
  @IBOutlet weak var billField: UITextField!
  @IBOutlet weak var tipControl: UISegmentedControl!
  @IBOutlet weak var percentageLabel: UILabel!
  @IBOutlet weak var tipSlider: UISlider!
  @IBOutlet weak var twoSplitLabel: UILabel!
  @IBOutlet weak var threeSplitLabel: UILabel!
  @IBOutlet weak var fourSplitLabel: UILabel!
  @IBOutlet weak var customSplitLabel: UILabel!
  @IBOutlet weak var peopleStepper: UIStepper!
  @IBOutlet weak var customPeopleLabel: UILabel!
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    let defaults = UserDefaults.standard
    
    tipControl.selectedSegmentIndex = defaults.integer(forKey: "segmentIndex")
    if (tipControl.selectedSegmentIndex == 0) {
      tipSlider.value = 18
    } else {
      tipSlider.value = defaults.float(forKey: "sliderValue")
    }
    percentageLabel.text = String(format: "%.0f%%", (tipSlider.value.rounded()))
    
    
    if (tipControl.selectedSegmentIndex != 3) {
      tipSlider.isEnabled = false
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    tipSlider.minimumValue = 0
    tipSlider.maximumValue = 50
    tipSlider.value = 18;
    
    peopleStepper.stepValue = 1.0
    peopleStepper.value = 5.0
    peopleStepper.maximumValue = 20.0
    peopleStepper.minimumValue = 1.0
    
    
  }

  @IBAction func onTap(_ sender: Any) {
    
    view.endEditing(true)
  }
  
  @IBAction func calculateTip(_ sender: Any) {
    
    let bill = Float(billField.text!) ?? 0
    var tip: Float
    var total: Float
    
    if (tipControl.selectedSegmentIndex != 3) {
      let tipPercentages = [0.18, 0.2, 0.25]
      tipSlider.isEnabled = false
      
      tip = bill * Float(tipPercentages[tipControl.selectedSegmentIndex])
      total = bill + tip
      
      tipSlider.value = Float(tipPercentages[tipControl.selectedSegmentIndex] * 100)
      tipLabel.text = String(format: "$%.2f", tip)
      totalLabel.text = String(format: "$%.2f", total)
      percentageLabel.text = String(format: "%.0f%%", tipPercentages[tipControl.selectedSegmentIndex] * 100)
      
    } else {
      
      tipSlider.isEnabled = true
      percentageLabel.text = String(Int(tipSlider.value))
      
      tip = bill * 0.01 * tipSlider.value.rounded()
      total = bill + tip
      
      tipLabel.text = String(format: "$%.2f", tip)
      totalLabel.text = String(format: "$%.2f", total)
      percentageLabel.text = String(format: "%.0f%%", (tipSlider.value.rounded()))
    }
    
    twoSplitLabel.text = String(format: "$%.2f", total/2)
    threeSplitLabel.text = String(format: "$%.2f", total/3)
    fourSplitLabel.text = String(format: "$%.2f", total/4)
    customSplitLabel.text = String(format: "$%.2f", total/Float(peopleStepper.value))
    
    
  }
  
  @IBAction func sliderChanged(_ sender: Any) {
    
    //print(tipSlider.value)
    percentageLabel.text = String(format: "%.0f%%", (tipSlider.value.rounded()))
    
    calculateTip(tipSlider);
  }
  
  @IBAction func stepperChanged(_ sender: Any) {
    customPeopleLabel.text = String(format: "%.0f", peopleStepper.value)
    calculateTip(peopleStepper)
  }
}

