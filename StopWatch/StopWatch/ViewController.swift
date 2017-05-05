//
//  ViewController.swift
//  StopWatch
//
//  Created by Zachary Hardin on 5/4/17.
//  Copyright © 2017 BlueFox Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: Properties
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    var timerStartValue = "00:00:00"
    var timer = Timer()
    var isPlaying = false
    var counter = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeLabel.text = String(counter)
        disableButton(button: pauseButton)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func updateTimer() {
        counter = counter + 0.1
        timeLabel.text = String(format: "%.1f", counter)
    }
    
    //MARK: Actions
    @IBAction func startTimer(_ sender: Any) {
        if (isPlaying) {
            return
        }
        
        disableButton(button: startButton)
        enableButton(button: pauseButton)
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        isPlaying = true
    }
    
    @IBAction func pauseTimer(_ sender: Any) {
    }
    
    @IBAction func clearTimer(_ sender: Any) {
    }
}

