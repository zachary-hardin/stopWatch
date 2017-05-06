//
//  timeService.swift
//  StopWatch
//
//  Created by Zachary Hardin on 5/4/17.
//  Copyright © 2017 BlueFox Inc. All rights reserved.
//

import Foundation
import UIKit

class StopWatch {
    let MAX_SECONDS = 60
    let MAX_MINUTES = 60
    
    var seconds = 0
    var minutes = 0
    var hours = 0
    var initialTime = String(format: "%02i:%02i:%02i", 0, 0, 0)
    
    func increaseTimer(_ timeLabel: UILabel) {
        addSecond()
        
        if (seconds == MAX_SECONDS) {
            seconds = 0
            addMinute()
        }
        
        if (minutes == MAX_MINUTES) {
            minutes = 0
            addHour()
        }
        
        timeLabel.text = String(format: "%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    func resetTime() {
        seconds = 0
        minutes = 0
        hours = 0
    }
    
    private func addSecond() {
        seconds = seconds + 1
    }
    
    private func addMinute() {
        minutes = minutes + 1
    }
    
    private func addHour() {
        hours = hours + 1
    }
}
