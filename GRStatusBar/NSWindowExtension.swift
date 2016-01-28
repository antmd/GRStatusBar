//
//  NSWindowExtension.swift
//  GRStatusBar
//
//  Created by Guilherme Rambo on 27/01/16.
//  Copyright © 2016 Guilherme Rambo. All rights reserved.
//

import Cocoa

private var _NSWindowStatusBarAssociatedObjectKey = UnsafePointer<Void>()

public extension NSWindow {

    public var statusBar: GRStatusBar {
        get {
            if let existingBar = objc_getAssociatedObject(self, _NSWindowStatusBarAssociatedObjectKey) as? GRStatusBar {
                return existingBar
            } else {
                let newBar = GRStatusBar(window: self)
                objc_setAssociatedObject(self, _NSWindowStatusBarAssociatedObjectKey, newBar, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                return newBar
            }
        }
    }
    
}