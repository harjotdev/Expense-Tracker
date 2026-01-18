//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPcButton: UIButton!
    @IBOutlet weak var twentyPctbutton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    var tip: Float = 0.0
    var totalAm = "0"
    var split = "0"
    var peoples = "0"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPcButton.isSelected = false
        twentyPctbutton.isSelected = false
        sender.isSelected = true
        
        if zeroPctButton.isSelected == true {
            tip = 0
        }
        else if tenPcButton.isSelected == true {
            tip = 10
        }
        else if twentyPctbutton.isSelected == true {
            tip = 20
        }
      
        
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f" , sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
         let billtext = billTextField.text ?? "0"
        let people = Float(splitNumberLabel.text ?? "1") ?? 1.0
        let amount = Float(billtext) ?? 0.0
        let totalAmount = (amount + (amount * tip/100)) / people
        totalAm = String(format: "%.2f", totalAmount)
        split = String(format: "%.0f", tip)
        peoples = String (format: "%.0f", people)
        
        self.performSegue(withIdentifier: "gotoResult", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoResult"{
            let destinationVC = segue.destination as! ResulViewController
            destinationVC.totalAm = totalAm
            destinationVC.split = split
            destinationVC.peoples = peoples
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}

