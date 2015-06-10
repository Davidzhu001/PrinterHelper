//
//  AppDelegate.swift
//  PrinterHelper
//
//  Created by ZhuWeicheng on 6/9/15.
//  Copyright (c) 2015 Zhu,Weicheng. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var timerCounterDisplayer: NSTextField!
    var minutes: Double?;
    var timer = NSTimer();
    
    var isCounting: Bool = false
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }

    @IBAction func timerStart(sender: AnyObject) {
        if isCounting == false {
            var timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "countingTime", userInfo: nil, repeats: true)
            isCounting = true
            }   else {
            println("test")
            
        }
        
    }
    @IBAction func addingTime(sender: AnyObject) {
    
        if minutes != nil {
            minutes = minutes!;
            minutes = minutes! + 10
        }   else {
            minutes = 0;
            minutes = minutes! + 10
        }

    }
    
    func countingTime() {
        if minutes > 0 {
            timerCounterDisplayer.doubleValue = minutes!
            minutes = minutes! - 1
            timerCounterDisplayer.stringValue = "This minutes \(timerCounterDisplayer.doubleValue) left"
            println("time \(timerCounterDisplayer.doubleValue)")
            println("time \(minutes)")
        }
        else {
            timerCounterDisplayer.stringValue = "you need to change some thing"
            }
    
    }

}

