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
    var seconds: Double?;
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
        
        if seconds != nil {
            seconds = seconds!;
            seconds = seconds! + 10
        }   else {
            seconds = 0;
            seconds = seconds! + 10
        }
        
    }
    
    func countingTime() {
        if seconds > 0 {
            var min = uint8(seconds!)
            seconds = seconds! - 1
            let strMinutes = String(format: "%02d",  min)
            timerCounterDisplayer.stringValue = "This seconds \(strMinutes) left"
            println("time \(timerCounterDisplayer.doubleValue)")
            println("time \(seconds)")
        }
        else {
            timerCounterDisplayer.stringValue = "you need to change some thing"
        }
        
    }
    
}