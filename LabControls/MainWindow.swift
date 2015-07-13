//
//  MainWindow.swift
//  LabControls
//
//  Created by Ruben on 7/10/15.
//  Copyright © 2015 9Labs. All rights reserved.
//

import Cocoa

final class MainWindow: NSWindow {

    override init(contentRect: NSRect, styleMask aStyle: Int, backing bufferingType: NSBackingStoreType, `defer` flag: Bool) {
        super.init(contentRect: contentRect, styleMask: aStyle, backing: bufferingType, `defer`: flag)

        contentView.wantsLayer = true
        titlebarAppearsTransparent = true
        movableByWindowBackground = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @available(OSX 10.11, *) func setCustomDarkAppearance() {
        appearance = NSAppearance(appearanceNamed: "CustomDarkAppearance", bundle: nil)
    }

    func setVibrantDarkAppearance() {
        appearance = NSAppearance(named: NSAppearanceNameVibrantDark)
    }

    func setVibrantLightAppearance() {
        appearance = NSAppearance(named: NSAppearanceNameVibrantLight)
    }

    func setAquaAppearance() {
        appearance = NSAppearance(named: NSAppearanceNameAqua)
    }
}
