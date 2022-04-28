//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var eggProgress: UIProgressView!
    @IBOutlet weak var eggTimer: UILabel!
    let eggTimes = ["Soft": 10, "Medium": 5,"Hard": 7]
    var timer = Timer()
    var totalTime = 0
    var secondsRemaining = 0
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        let hardness = sender.currentTitle! //Soft, Medium, Hard
        totalTime = eggTimes[hardness]!
        secondsRemaining = totalTime
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTimer(){
        if secondsRemaining == 0 {
            print("Done")
            eggProgress.progress = Float(totalTime - secondsRemaining)/Float(totalTime)
            timer.invalidate()
        }
        if secondsRemaining > 0{
            eggProgress.progress = Float(totalTime - secondsRemaining)/Float(totalTime)
            secondsRemaining -= 1
            
        }
    }
    
}
