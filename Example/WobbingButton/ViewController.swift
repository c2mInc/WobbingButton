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
    @IBOutlet weak var buttonWithTitle: WobbingButton!
    @IBOutlet weak var buttonWithImage: WobbingControlWithIcon!
    @IBOutlet weak var buttonRounded: RoundedWobbingControl!

    @IBAction func buttonTapped(_ sender: Any) {
        performSegue(withIdentifier: "next", sender: nil)
    }

    @IBAction func roundedButtONTapped(_ sender: RoundedWobbingControl) {
        debugPrint("roundedButtONTapped")
    }
}

