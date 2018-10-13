//
//  REPLViewController.swift
//  Pyto
//
//  Created by Adrian Labbe on 10/12/18.
//  Copyright © 2018 Adrian Labbé. All rights reserved.
//

import UIKit

/// The View controller for the REPL in the Tab bar controller.
class REPLViewController: ConsoleViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "REPL"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        prompt = ""
        isAskingForInput = false
        textView.text = ""
        if Python.shared.isREPLRunning {
            if !Python.shared.isScriptRunning {
                PyInputHelper.userInput = "import os; import PytoClasses; os.system = PytoClasses.Python.shared.system; import code; code.interact()"
            } else {
                PyOutputHelper.print("An instance of a module is already running and two scripts cannot run at the same time, to kill it, quit the app. This can be caused by an inifite loop.")
            }
        }
    }
    
    override func input(prompt: String) {
        guard textView != nil else {
            return
        }
        super.input(prompt: prompt)
    }
}

