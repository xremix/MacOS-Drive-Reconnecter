//
//  ViewController.swift
//  MacOS-Drive-Reconnecter
//
//  Created by Toni Hoffmann on 19.09.18.
//  Copyright © 2018 Toni Hoffmann. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    var shell = ShellBridge()
    override func viewDidLoad() {
        super.viewDidLoad()
//        let output = shell.runCommand(cmd: "/usr/bin/git", args: "status").output

        let output2 = shell.runCommand(cmd: "/usr/sbin/diskutil", args: "list")
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

