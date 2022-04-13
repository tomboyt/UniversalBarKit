//
//  TQTabBarController.swift
//  TQUBar
//
//  Created by admin on 2022/4/1.
//

import UIKit
import Lottie
public protocol TQTabBarControllerDelegate : NSObjectProtocol{
    func TQTabBarSelectItemIndex(atIndex: Int)
}
public class TQTabBarController: UITabBarController {
    private static var shared : TQTabBarController?
    @objc class func sharedInstance()->TQTabBarController{
        guard let instance = shared else{
            shared = TQTabBarController()
            return shared!
        }
        return instance
    }
    @objc func destroyInstance(){
        TQTabBarController.shared = nil
    }
    
    open weak var tabBarControllerdelegate : TQTabBarControllerDelegate?
    private var currentItem : Int? = 0
    public var nav:UINavigationController = TQNavigationViewController()
    private var rootsVC = [UIViewController]()
    private var lottiesString = [String]()
    private var back_groudColor : UIColor? = UIColor.white
    private lazy var customTabBar : TQTabBar = {
        let bar = TQTabBar()
        bar.Bardelegate = self
        bar.tag = 999999
        return bar
    }()
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.selectedIndex = 0
    }
    
    func tabBar(controllers:Array<UIViewController>,lotties : Array<String>,backgroudColor : UIColor?){
        rootsVC = controllers
        lottiesString = lotties
        back_groudColor = backgroudColor
        var navVCArr = [UIViewController]()
        for M in 0..<controllers.count {
            nav = TQNavigationViewController(rootViewController:controllers[M])
            navVCArr.append(nav)
        }
        self.viewControllers = navVCArr

        let tabarbcview = UIView(frame: CGRect(x: 0, y: 0, width: tabBar.frame.width, height: 100))
        tabarbcview.backgroundColor = backgroudColor
        tabarbcview.tag = 103
        self.customTabBar.addSubview(tabarbcview)
        let shadowLine = UIView(frame: CGRect(x: 0, y: 0, width: tabBar.frame.width, height: 0.5))
        shadowLine.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        shadowLine.tag = 104
        self.customTabBar.addSubview(shadowLine)
        //创建items数组
        var items = [TQTabBarItem]()
        for i in 0..<controllers.count{
            let item = TQTabBarItem()
            item.setAnimationJsonName(animationJsonName: lotties[i])
            item.tag = i
            items.append(item)
        }
        self.setBeginItemAnimation(itemView: items[0], item: 0)
        self.customTabBar.tabBariItems = items
        self.tabBar.addSubview(self.customTabBar)
        self.customTabBar.frame = tabBar.bounds
    }
    
    public func taptabBarItem(itemIndex : Int){
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            self.selectedIndex = itemIndex
            let obj : TQTabBarItem = self.customTabBar.tabBariItems[itemIndex]
            obj.tapItem()
        }
    }
}
// MARK:CLTabBarDelegate
extension TQTabBarController : TQTabBarDelegate {
    //tabBar点击事件
    func didtTabBarSelectItem(tab: TQTabBar, item: TQTabBarItem, atIndex: Int) {
        self.customTabBar.isHidden = false
        if tabBarControllerdelegate != nil{
            tabBarControllerdelegate?.TQTabBarSelectItemIndex(atIndex: atIndex)
            print("选择Item",atIndex)
        }
        if currentItem != atIndex{
            let tabBarItem : TQTabBarItem = tab.tabBariItems[currentItem!]
            DispatchQueue.main.async {
                self.setStopItemAnimationWithItem(item: tabBarItem)
                self.setBeginItemAnimation(itemView: item, item: atIndex)
            }
        }
        
        self.selectedIndex = atIndex
    }
    
    //设置首次动画,保存上次动画的item
    func setBeginItemAnimation(itemView:TQTabBarItem,item:Int){
        for view in itemView.subviews{
            if view.isKind(of: NSClassFromString("LOTAnimationView")!){
                if (view as? LOTAnimationView)?.animationProgress == 0{
                    currentItem = item
                    (view as? LOTAnimationView)?.play(toProgress: 0.5, withCompletion: { finsh in})
                }
                break
            }
        }
    }
    
    //根据上次动画的item关闭上次动画
    func setStopItemAnimationWithItem(item:TQTabBarItem){
        for view in item.subviews{
            if view.isKind(of: NSClassFromString("LOTAnimationView")!){
                let animationView = view as? LOTAnimationView
                animationView?.stop()
                break
            }
        }
    }
}

// MARK:UITabBarControllerDelegate
extension TQTabBarController : UITabBarControllerDelegate{
    public func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
    }
}
