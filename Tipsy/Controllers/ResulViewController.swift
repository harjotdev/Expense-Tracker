//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Harjot singh on 24/10/25.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

import UIKit

class ResulViewController: UIViewController {
    var totalAm: String?
    var split : String?
    var peoples : String?
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var settingsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = totalAm
        settingsLabel.text = "Split between \(peoples!) people, with \(split!)% tip"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    */

}
