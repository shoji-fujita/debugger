//
//  DebugScreenSizeViewController.swift
//  test
//
//  Created by shoji on 2017/10/29.
//  Copyright © 2017年 shoji fujita. All rights reserved.
//

import UIKit

class DebugScreenSizeViewController: UIViewController {
  
  let devices: [Constant.Device] = [.inch4, .inch4_7, .inch5_5, .inch5_8]
  @IBOutlet weak var segmentedControl: UISegmentedControl!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    appDelegate?.debugWindow?.frame.size.height = 150
    
    for i in 0..<devices.count {
      if devices[i].size() == appDelegate?.window?.frame.size {
        segmentedControl.selectedSegmentIndex = i
        break
      }
    }
  }
  
  @IBAction func tappedSegmentedControl(_ sender: UISegmentedControl) {
    UIApplication.shared.keyWindow?.change(device: selectedDevice())
  }
  
  @IBAction func tappedScreenshotButton(_ sender: UIButton) {
    let view = UIApplication.shared.keyWindow!
    let image = AppUtil.screenShot(view: view)
    
    let dateString = Date().string(format: "yyyyMMddHHmmss")
    let fileName = selectedDevice().nameExample() + "_" + dateString + ".jpg"
    _ = AppUtil.write(image: image, fileName: fileName, folderPath: AppUtil.documentPath())
  }
  
  private func selectedDevice() -> Constant.Device {
    return devices[segmentedControl.selectedSegmentIndex]
  }
}

class AppUtil {
  
  class func deviceInch() -> Constant.Device? {
    let size = UIScreen.main.bounds.size
    return Constant.Device.all().filter({ $0.size() == size }).first
  }
  
  class func documentPath() -> URL {
    let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    return URL(string: path)!
  }
  
  class func screenShot(view: UIView) -> UIImage {
    let rect = view.bounds
    UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
    let context = UIGraphicsGetCurrentContext()!
    view.layer.render(in: context)
    let capturedImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return capturedImage!
  }
  
  class func write(image: UIImage, fileName: String, folderPath: URL) -> Bool {
    guard let jpegData = UIImageJPEGRepresentation(image, 0.5) else {
      return false
    }
    let data = NSData(data: jpegData)
    let imagePath = AppUtil.documentPath().appendingPathComponent(fileName)
    data.write(toFile: imagePath.absoluteString, atomically: true)
    return true
  }
}

extension Date {
  
  func string(format: String) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = format
    let string = formatter.string(from: self)
    return string
  }
}
