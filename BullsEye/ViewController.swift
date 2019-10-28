//
//  ViewController.swift
//  BullsEye
//
//  Created by MacStudent on 2019-10-25.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        //slider.value = 60
        //currentValue = lround(slider.value)
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = Int(slider.value)
        
    }
    
  
    

    @IBAction func showAlert() {
        let message = "The value of the slider is: \(currentValue) and the targeted value is\(targetValue)"
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
        
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
    }
}

