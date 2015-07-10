//
//  ViewController.swift
//  LabControls
//
//  Created by Ruben on 7/10/15.
//  Copyright © 2015 9Labs. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    var mainWindow: MainWindow?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: "toggleDarkUI:",
            name: AppNotification.ToggleDarkUI,
            object: nil
        )
    }

    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    override func viewWillAppear() {
        if let mainWindow = view.window as? MainWindow {
            self.mainWindow = mainWindow
            mainWindow.title = "UI / UX Lab"
            mainWindow.setVibrantLightAppearance()
        }
    }

    override var representedObject: AnyObject? {
        didSet {
            // Update the view, if already loaded.
        }
    }

    @objc private func toggleDarkUI(notification: NSNotification) {
        if let state = notification.object as? Int {
            if let mainWindow = self.mainWindow {
                if state == NSOnState {
                    mainWindow.setVibrantDarkAppearance()
                } else {
                    mainWindow.setVibrantLightAppearance()
                }
            }
        }
    }
}

