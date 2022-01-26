//
//  ViewController.swift
//  JoyTunesDemo
//
//  Created by Brian Boyle on 26/01/2022.
//

import UIKit
import Intercom

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func openIntercom(_ sender: UIButton) {
        Intercom.presentMessenger()
    }
}

