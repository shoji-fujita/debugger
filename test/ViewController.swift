//
//  ViewController.swift
//  test
//
//  Created by shoji on 2017/03/25.
//  Copyright © 2017年 shoji fujita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    (UIApplication.shared.delegate as? AppDelegate)?.showDebugWindow()
  }
}
