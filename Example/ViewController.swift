//
//  ViewController.swift
//  Example
//
//  Created by Nathan.F.Johnson on 4/20/17.
//  Copyright © 2017 NathanFJohnson. All rights reserved.
//

import UIKit
import NFJDemoWindow

class ViewController: UIViewController {

  @IBAction func switchSwitched(_ sender: UISwitch) {
    guard let demoWindow = view.window as? NFJDemoWindow else { return }
    demoWindow.activated = sender.isOn
  }

  override var prefersStatusBarHidden: Bool {
    return true
  }

}

