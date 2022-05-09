//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Marcos Gois on 08/05/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var totalBill: Float = 0.0
    var splitNumber: Float = 0.0
    var pctChosen: String = "0.0"
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(format: "%.2f", totalBill)
        settingsLabel.text = "Split between \(String(format: "%.0f", splitNumber)) people, with \(pctChosen) tip"
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }

}
