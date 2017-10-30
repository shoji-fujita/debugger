//
//  UIWindowExtension.swift
//  test
//
//  Created by shoji on 2017/10/29.
//  Copyright © 2017年 shoji fujita. All rights reserved.
//

import UIKit

extension UIWindow {
  
  func change(device: Constant.Device) {
    self.frame = CGRect(origin: .zero, size: device.size())
  }
}
