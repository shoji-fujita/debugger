//
//  DebugWindow.swift
//  test
//
//  Created by shoji on 2017/10/29.
//  Copyright © 2017年 shoji fujita. All rights reserved.
//

import UIKit

class DebugWindow: UIWindow {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.layer.cornerRadius = 10
    self.clipsToBounds = true
    self.alpha = 0.5
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    let touch = touches.first!
    
    let location = touch.location(in: self)
    let prevLocation = touch.previousLocation(in: self)
    
    self.frame.origin.x += (location.x - prevLocation.x)
    self.frame.origin.y += (location.y - prevLocation.y)
  }
}
