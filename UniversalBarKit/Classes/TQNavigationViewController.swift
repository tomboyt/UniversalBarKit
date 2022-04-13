//
//  TQNavigationViewController.swift
//  TQUBar
//
//  Created by admin on 2022/4/1.
//

import UIKit

@objc public class TQNavigationViewController: UINavigationController {

    public override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.barStyle = .black
        self.navigationBar.backgroundColor = UIColorFromRGB(rgbValue: 0x141414)
        self.interactivePopGestureRecognizer?.delegate = self as UIGestureRecognizerDelegate
    }
}
extension TQNavigationViewController: UIGestureRecognizerDelegate {
    public override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 0 {
            let back = UIBarButtonItem.init(image: UIImage.init(named: "icon_top_fanhui_white"), style: .done, target: self, action: #selector(popback))
            back.tintColor = .white
            viewController.navigationItem.leftBarButtonItem = back
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: true)
    }
    @objc func popback() {
        self.popViewController(animated: true)
    }
}
