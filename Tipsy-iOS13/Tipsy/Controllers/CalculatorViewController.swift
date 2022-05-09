//
//  CalculatorViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    var tipSelected: Float = 0.1
    var tip: String = "10%"
    var splitNumberChosen: Float = 2
    var bill: Float = 0
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    func selectButton(sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
    }
    
    func pctPressed(sender: UIButton){
        tip = sender.currentTitle ?? "0.1"
        switch (tip){
            case "0%":
                tipSelected = 0.0
                break
            case "10%":
                tipSelected = 0.1
                break
            case "20%":
                tipSelected = 0.2
                break
            default:
                break
        }
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        selectButton(sender: sender)
        pctPressed(sender: sender)
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        splitNumberChosen = Float(sender.value)
        billTextField.endEditing(true)
    }
    
    func calculateSplitBill(bill: Float, splitters: Float, tip: Float) -> Float{
        return ((1+tip)*bill)/splitters
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        bill = Float(billTextField.text!) ?? 0.0
        bill = calculateSplitBill(bill: bill, splitters: splitNumberChosen, tip: tipSelected)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.totalBill = bill
            destinationVC.pctChosen = tip
            destinationVC.splitNumber = splitNumberChosen
        }
    }

}

