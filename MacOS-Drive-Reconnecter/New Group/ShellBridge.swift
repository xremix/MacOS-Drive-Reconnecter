//
//  ShellBridge.swift
//  MacOS-Drive-Reconnecter
//
//  Created by Toni Hoffmann on 19.09.18.
//  Copyright © 2018 Toni Hoffmann. All rights reserved.
//

import Cocoa
import Foundation
class ShellBridge: NSObject {
    func runCommand(cmd : String, args : String...) -> (output: [String], error: [String], exitCode: Int32) {
        
        var output : [String] = []
        var error : [String] = []
        
        let task = Process()
        task.launchPath = cmd
        task.arguments = args
        
        let outpipe = Pipe()
        task.standardOutput = outpipe
        let errpipe = Pipe()
        task.standardError = errpipe
        
        task.launch()
        
        let outdata = outpipe.fileHandleForReading.readDataToEndOfFile()
        if var string = String(data: outdata, encoding: .utf8) {
            string = string.trimmingCharacters(in: .newlines)
            output = string.components(separatedBy: "\n")
        }
        
        let errdata = errpipe.fileHandleForReading.readDataToEndOfFile()
        if var string = String(data: errdata, encoding: .utf8) {
            string = string.trimmingCharacters(in: .newlines)
            error = string.components(separatedBy: "\n")
        }
        
        task.waitUntilExit()
        let status = task.terminationStatus
        
        return (output, error, status)
    }
//    func shell(launchPath: String, arguments: [String] = []) -> (String? , Int32) {
//        let task = Process()
//        task.launchPath = launchPath
//        task.arguments = arguments
//
//        let pipe = Pipe()
//        task.standardOutput = pipe
//        task.standardError = pipe
//        task.launch()
//        let data = pipe.fileHandleForReading.readDataToEndOfFile()
//        let output = String(data: data, encoding: .utf8)
//        task.waitUntilExit()
//        return (output, task.terminationStatus)
//    }
//    func run(launchPath: String, arguments: [String]) -> String?
//    {
//        let task = Process()
//        task.launchPath = launchPath
//        task.arguments = arguments
//
//        let pipe = Pipe()
//        task.standardOutput = pipe
//        task.launch()
//
//        let data = pipe.fileHandleForReading.readDataToEndOfFile()
//        let output = String(data: data, encoding: String.Encoding.utf8)
//
//        return output
//    }
}
