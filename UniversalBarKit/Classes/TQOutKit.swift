//
//  TQOutKit.swift
//  TQUBar
//
//  Created by admin on 2022/4/1.
//

import Foundation
import UIKit

//TQTabBarController
public let TQTabBarShared = TQTabBarController.sharedInstance()


/// 初始化TabBar《lotties方式》
/// - Parameters:
///   - controllers: 按钮主控制器
///   - lotties: lotties文件
///   - backgroudColor: tabbar背景色
public func ConfigTabBar(controllers:Array<UIViewController>,lotties : Array<String>,backgroudColor : UIColor?=UIColor.white)->TQTabBarController {
    TQTabBarController.sharedInstance().destroyInstance()
    TQTabBarController.sharedInstance().tabBar(controllers: controllers, lotties: lotties,backgroudColor: backgroudColor)
    return TQTabBarController.sharedInstance()
}
