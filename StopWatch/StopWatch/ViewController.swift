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
    
    var timer = Timer()
    var isPlaying = false
    var stopWatch = StopWatch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setInitialTimeLabel()
        disableButton(button: pauseButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //MARK: Actions
    @IBAction func startTimer(_ sender: Any) {
        if (isPlaying) {
            return
        }
        
        disableButton(button: startButton)
        enableButton(button: pauseButton)
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        isPlaying = true
    }
    
    @IBAction func pauseTimer(_ sender: Any) {
        disableButton(button: pauseButton)
        enableButton(button: startButton)
        
        timer.invalidate()
        isPlaying = false
    }
    
    @IBAction func clearTimer(_ sender: Any) {
        enableButton(button: startButton)
        disableButton(button: pauseButton)
        
        timer.invalidate()
        isPlaying = false
        
        stopWatch.resetTime()
        
        setInitialTimeLabel()
    }
    
    //MARK: Helpers
    func updateTimer() {
        stopWatch.increaseTimer(timeLabel)
    }
    
    func setInitialTimeLabel() {
        timeLabel.text = String(stopWatch.initialTime)
    }
}

