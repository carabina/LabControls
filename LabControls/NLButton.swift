//
//  NLButton.swift
//  LabControls
//
//  Created by Ruben Nine on 10/07/15.
//  Copyright © 2015 9Labs. All rights reserved.
//

import Cocoa

final class NLButtonCell: NSButtonCell {
    override func drawTitle(title: NSAttributedString, withFrame frame: NSRect, inView controlView: NSView) -> NSRect {
        return super.drawTitle(title, withFrame: frame, inView: controlView)
    }
}

class NLButton: NSButton {
    override class func cellClass() -> AnyClass? {
        return NLButtonCell.self
    }
}
