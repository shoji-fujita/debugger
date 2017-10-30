//
//  Constant.swift
//  test
//
//  Created by shoji on 2017/10/29.
//  Copyright © 2017年 shoji fujita. All rights reserved.
//

import UIKit

class Constant {
  
  enum Device {
    case inch4    // 例）iPhoneSE
    case inch4_7  // 例）iPhone7
    case inch5_5  // 例）iPhonePlus
    case inch5_8  // 例）iPhoneX
    
    func size() -> CGSize {
      switch self {
      case .inch4:
        return CGSize(width: 320, height: 568)
      case .inch4_7:
        return CGSize(width: 375, height: 667)
      case .inch5_5:
        return CGSize(width: 414, height: 736)
      case .inch5_8:
        return CGSize(width: 375, height: 812)
      }
    }
    
    func nameExample() -> String {
      switch self {
      case .inch4:
        return "iPhoneSE"
      case .inch4_7:
        return "iPhone7"
      case .inch5_5:
        return "iPhonePlus"
      case .inch5_8:
        return "iPhoneX"
      }
    }
    
    static func all() -> [Device] {
      return [.inch4, .inch4_7, .inch5_5, .inch5_8]
    }
  }
  
  enum CustomUrlScheme: String {
    case debugDevice = "custom-url-scheme://"
  }
}
