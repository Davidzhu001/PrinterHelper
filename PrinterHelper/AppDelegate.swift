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
    
    @IBOutlet weak var TimerSituation: NSTextField!
    @IBOutlet weak var printerNameField: NSTextField!
    @IBOutlet weak var printerNameOutlet: NSTextField!
    @IBAction func printerNameConfrimButton(sender: AnyObject) {
        printerNameOutlet.stringValue = printerNameField.stringValue
    }
    
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
            timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "countingTime", userInfo: nil, repeats: true)
            isCounting = true
        }   else {
            println("test")
            
        }
        
    }
    
    @IBAction func Reset(sender: AnyObject) {
        seconds = 10
        timer.invalidate();
        isCounting = false
        timer = NSTimer();
        timeformat();

    }
    
    @IBAction func timeStop(sender: AnyObject) {
        timer.invalidate();
        isCounting = false
        timer = NSTimer();
        timeformat();

    }
    
    
    func timeformat() {
        var vseconds = UInt16(seconds!)
        let mins = vseconds / 60
        let aseconds = vseconds % 60
        let ahours = mins / 60
        let aminutes = mins % 60
        let strMinutes = String(format: "%02d",  aminutes)
        let strSeconds = String(format: "%02d",  aseconds)
        let strHours = String(format: "%02d",  ahours)
        timerCounterDisplayer.stringValue = "\(strHours) :\(strMinutes) : \(strSeconds)"
    }
    
    
    
    
    func addingTimeFram(number: Double) {
        
        if seconds != nil {
            seconds = seconds!;
            seconds = seconds! + number
            timeformat();
        }   else {
            seconds = 0;
            seconds = seconds! + number;
            timeformat();
        }
        
    }
    
    
    
    func countingTime() {
        if seconds > 0 {
            seconds = seconds! - 1
            timeformat();
            TimerSituation.stringValue = "Running"
            println("time \(timerCounterDisplayer.doubleValue)")
            println("time \(seconds)")
        }
        else {
            timerCounterDisplayer.stringValue = "ready to chane"
            showNotification();
            timer.invalidate();
            isCounting = false
            timer = NSTimer();
                    }
        
    }
    
    func showNotification() -> Void {
        var notification = NSUserNotification()
        notification.title = "Test from Swift"
        notification.informativeText = "The body of this Swift notification"
        notification.soundName = NSUserNotificationDefaultSoundName
        NSUserNotificationCenter.defaultUserNotificationCenter().deliverNotification(notification)
    }
    
}