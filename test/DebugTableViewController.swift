//
//  DebugTableViewController.swift
//  test
//
//  Created by shoji on 2017/10/29.
//  Copyright © 2017年 shoji fujita. All rights reserved.
//

import UIKit

class DebugTableViewController: UITableViewController {
  
  @IBAction func tappedCloseButton(_ sender: UIBarButtonItem) {
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    appDelegate?.debugWindow = nil
    appDelegate?.window?.frame = CGRect(origin: .zero, size: UIScreen.main.bounds.size)
  }
}
