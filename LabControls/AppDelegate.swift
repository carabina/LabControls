//
//  AppDelegate.swift
//  LabControls
//
//  Created by Ruben on 7/10/15.
//  Copyright © 2015 9Labs. All rights reserved.
//

import Cocoa

struct AppNotification {
    static let ToggleDarkUI = "AppNotificationToggleDarkUI"
}

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }

    @IBAction func toggleDarkUI(sender: NSMenuItem?) {
        if let menuItem = sender {
            menuItem.state = menuItem.state == NSOffState ? NSOnState : NSOffState
            NSNotificationCenter.defaultCenter().postNotificationName(AppNotification.ToggleDarkUI, object: menuItem.state)
        }
    }
}

