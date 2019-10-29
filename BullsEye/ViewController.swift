//
//  ViewController.swift
//  BullsEye
//
//  Created by MacStudent on 2019-10-25.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
   
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var roundLabel: UILabel!
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    var score = 0
    var round: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        //slider.value = 60
        //currentValue = lround(slider.value)
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = Int(slider.value)
        
    }
    
  
    

    @IBAction func showAlert() {
        let difference = abs(targetValue - currentValue)
        
        let points = 100 - difference
        score += points
    
        let message = "You scored \(points) points"
        
//        let message = "The value of the slider is: \(currentValue)" +
//        "\nThe targeted value is\(targetValue)" +
//        "\nThe difference is: \(difference)"

        let alert = UIAlertController(title: "Hello, World",
                                      message: message,
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: .default,
                                   handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
        print("The value of the slider is now: \(slider.value)")
        print("The value of the slider is now: \(currentValue )")
    }
    
    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
        round += 1
        
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
}

