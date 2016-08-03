//
//  StopwatchViewController.swift
//  Clock Replica
//
//  Created by Sharon's Mac on 7/27/16.
//  Copyright © 2016 Sharon McDermott. All rights reserved.
//

import UIKit

//NSDate()
//var now = NSDate()
//
//now.timeIntervalSince1970
//NSDate().timeIntervalSince1970



class StopwatchViewController: UIViewController {
    enum StopWatchState {
        case Started
        case Stopped
        case Reset
    }
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    
    var state:StopWatchState?
    override func viewDidLoad() {
        super.viewDidLoad()
        transitionToState(.Reset)
        //        leftButton.setTitleColor(grayColor?, forState: <#T##UIControlState#>)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func leftButtonTapped(sender: UIButton) {
        if state == .Stopped {
            transitionToState(.Reset)
        }
    }
    @IBAction func rightButtonTapped(sender: UIButton) {
        if state == .Stopped || state == .Reset {
            transitionToState(.Started)
        } else if state == .Started {
            transitionToState(.Stopped)
        }
    }
    func transitionToState(newState:StopWatchState) {
        state = newState
        switch newState {
        case .Started:
            leftButton.setTitle("Lap", forState: .Normal)
            rightButton.setTitle("Stop", forState: .Normal)
            stateLabel.text = "Started"
        case .Stopped:
            leftButton.setTitle("Reset", forState: .Normal)
            rightButton.setTitle("Start", forState: .Normal)
            stateLabel.text = "Reset"
        case .Reset:
            leftButton.setTitle("Lap", forState: .Normal)
            rightButton.setTitle("Start", forState: .Normal)
            stateLabel.text = "Stopped"
        }
    }
}


//class StopwatchViewController: UIViewController {
//    enum StopWatchState {
//        case Started
//        case Stopped
//        case Reset
//    }
//    @IBOutlet weak var stateLabel: UILabel!
//    @IBOutlet weak var rightButton: UIButton!
//    @IBOutlet weak var leftButton: UIButton!
//    
//    var state:StopWatchState?
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        state = .Reset
//        rightButton.setTitle("Start", forState: .Normal)
//        leftButton.setTitle("Lap", forState: .Normal)
//        stateLabel.text = "Reset"
//        //        leftButton.setTitleColor(grayColor?, forState: <#T##UIControlState#>)
//        
//    }
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    @IBAction func leftButtonTapped(sender: UIButton) {
//        if state == .Stopped {
//            state = .Reset
//            rightButton.setTitle("Start", forState: .Normal)
//            leftButton.setTitle("Lap", forState: .Normal)
//            stateLabel.text = "Reset"
//        }
//    }
//    @IBAction func rightButtonTapped(sender: UIButton) {
//        if state == .Stopped || state == .Reset {
//            state = .Started
//            leftButton.setTitle("Lap", forState: .Normal)
//            rightButton.setTitle("Stop", forState: .Normal)
//            stateLabel.text = "Started"
//        } else if state == .Started {
//            state = .Stopped
//            leftButton.setTitle("Reset", forState: .Normal)
//            rightButton.setTitle("Start", forState: .Normal)
//            stateLabel.text = "Stopped"
//        }
//    }
//}
//
