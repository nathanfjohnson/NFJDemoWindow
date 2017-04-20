//
//  ViewController.swift
//  NFJDemoWindow
//
//  Created by Nathan F Johnson on 04/19/2017.
//  Copyright (c) 2017 Nathan F Johnson. All rights reserved.
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
