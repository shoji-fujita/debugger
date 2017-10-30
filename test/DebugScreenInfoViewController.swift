//
//  DebugScreenInfoViewController.swift
//  test
//
//  Created by shoji on 2017/10/29.
//  Copyright © 2017年 shoji fujita. All rights reserved.
//

import UIKit

class DebugScreenInfoViewController: UIViewController {

  @IBOutlet weak var textView: UITextView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    textView.text = topMostViewController().name()
  }
  
  func topMostViewController() -> UIViewController {
    var vc = UIApplication.shared.keyWindow?.rootViewController
    while vc!.presentedViewController != nil {
      vc = vc!.presentedViewController
    }
    return vc!
  }
}

extension NSObject {
  
  func name() -> String {
    return String(describing: type(of: self))
  }
}
