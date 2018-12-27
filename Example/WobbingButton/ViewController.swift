//
//  ViewController.swift
//  WobbingButton
//
//  Created by erkekin on 09/23/2018.
//  Copyright (c) 2018 erkekin. All rights reserved.
//

import UIKit
import WobbingButton

class ViewController: UIViewController {
    @IBOutlet weak var buttonWithTitle: WobbingControl! {didSet{
        buttonWithTitle.layer.cornerRadius = 10
        }}
    @IBOutlet weak var buttonWithImage: WobbingControlWithImage!
    @IBOutlet weak var buttonRounded: RoundedWobbingControl!
}

