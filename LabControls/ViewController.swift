//
//  ViewController.swift
//  LabControls
//
//  Created by Ruben on 7/10/15.
//  Copyright © 2015 9Labs. All rights reserved.
//

import Cocoa
import PureLayout

class ViewController: NSViewController {

    weak var mainWindow: MainWindow? {
        didSet {
            resetMainWindow()
        }
    }

    private var didSetupConstraints = false

    private lazy var okButton: NLButton = {
        let obj = NLButton(forAutoLayout: ())

        obj.setButtonType(.MomentaryLightButton)
        obj.bezelStyle = .RoundedBezelStyle
        obj.title = "OK"
        obj.keyEquivalent = "\r"
        obj.target = self
        obj.action = Selector("okPressed:")

        return obj
    }()

    private lazy var cancelButton: NLButton = {
        let obj = NLButton(forAutoLayout: ())

        obj.setButtonType(.MomentaryLightButton)
        obj.bezelStyle = .RoundedBezelStyle
        obj.title = "Cancel"

        return obj
    }()

    private lazy var launchToggleButton: NLButton = {
        let obj = NLButton(forAutoLayout: ())

        obj.setButtonType(.SwitchButton)
        obj.title = "Launch at startup"

        return obj
    }()

    private lazy var popupButton: NSPopUpButton = {
        let obj = NSPopUpButton(forAutoLayout: ())

        obj.menu?.removeAllItems()
        
        for item in ["Один, One, Un", "Два, Two, Dous", "Три, Three, Tres"] {
            obj.menu?.addItemWithTitle(item, action: nil, keyEquivalent: "")
        }

        return obj
    }()

    private lazy var textField: NSTextField = {
        let obj = NSTextField(forAutoLayout: ())

        obj.stringValue = "Some value goes here!"

        return obj
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        addControls()
        updateViewConstraints()
        registerForNotifications()
    }

    deinit {
        unregisterForNotifications()
    }

    override func viewWillAppear() {
        if mainWindow == nil {
            mainWindow = view.window as? MainWindow
        }
    }

    override var representedObject: AnyObject? {
        didSet {
            // Update the view, if already loaded.
        }
    }

    private func resetMainWindow() {
        mainWindow?.title = "UI / UX Lab"
        mainWindow?.setVibrantLightAppearance()
    }

    private func addControls() {
        view.addSubview(textField)
        view.addSubview(okButton)
        view.addSubview(cancelButton)
        view.addSubview(launchToggleButton)
        view.addSubview(popupButton)
    }

    override func updateViewConstraints() {
        if didSetupConstraints == false {
            didSetupConstraints = true

            // Setup constraints
            view.autoSetDimension(.Width, toSize: 400, relation: .GreaterThanOrEqual)
            view.autoSetDimension(.Height, toSize: 240, relation: .GreaterThanOrEqual)

            okButton.autoPinEdgeToSuperviewEdge(.Right, withInset: 22)
            okButton.autoPinEdgeToSuperviewEdge(.Bottom, withInset: 22)

            cancelButton.autoPinEdge(.Right, toEdge: .Left, ofView: okButton, withOffset: -11)
            cancelButton.autoPinEdgeToSuperviewEdge(.Bottom, withInset: 22)

            launchToggleButton.autoPinEdgeToSuperviewEdge(.Left, withInset: 22)
            launchToggleButton.autoPinEdgeToSuperviewEdge(.Bottom, withInset: 22)

            popupButton.autoPinEdgeToSuperviewEdge(.Right, withInset: 22)
            popupButton.autoPinEdge(.Bottom, toEdge: .Top, ofView: okButton, withOffset: -11)

            textField.autoPinEdgeToSuperviewEdge(.Top, withInset: 22)
            textField.autoPinEdgeToSuperviewEdge(.Left, withInset: 22)
            textField.autoPinEdgeToSuperviewEdge(.Right, withInset: 22)
        }

        super.updateViewConstraints()
    }

    private func registerForNotifications() {
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: "toggleDarkUI:",
            name: AppNotification.ToggleDarkUI,
            object: nil
        )
    }

    private func unregisterForNotifications() {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    @objc private func toggleDarkUI(notification: NSNotification) {
        if let state = notification.object as? Int {
            if state == NSOnState {
                mainWindow?.setCustomDarkAppearance()
            } else {
                mainWindow?.setVibrantLightAppearance()
            }
        }
    }
    
    @IBAction func okPressed(sender: AnyObject) {
        if let mainWindow = mainWindow {
            let alert = NSAlert()
            
            alert.messageText = "Error Gravissimus"
            alert.informativeText = "All your bases are belong to us!"

            alert.window.appearance = mainWindow.appearance
            alert.window.contentView?.wantsLayer = true

            alert.runModal()
        }
    }
}
