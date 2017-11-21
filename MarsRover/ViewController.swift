//
//  ViewController.swift
//  MarsRover
//
//  Created by Hanuman on 21/11/17.
//  Copyright © 2017 Hanuman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var commandTextView: UITextView!
    @IBOutlet weak var outputTextView: UITextView!
    
    var viewModel = MarsRoverViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        commandTextView.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func updateRover(_ sender: Any) {
        outputTextView.text = viewModel.processUserData(input: commandTextView.text)
    }
}
