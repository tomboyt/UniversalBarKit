//
//  TQTabBar.swift
//  TQUBar
//
//  Created by admin on 2022/4/1.
//

import UIKit
protocol TQTabBarDelegate : NSObjectProtocol{
    func didtTabBarSelectItem(tab:TQTabBar,item:TQTabBarItem,atIndex:Int)
}
class TQTabBar: UITabBar,TQTabBarItemDelegate {
    open weak var Bardelegate : TQTabBarDelegate?
    public var tabBariItems = [TQTabBarItem]()
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        // 移除系统的tabBarItem
        let cl : AnyClass = NSClassFromString("UITabBarButton")!
        for item in self.subviews {
            if item.isKind(of: cl){
                item.removeFromSuperview()
            }
        }
        //设置自定义的tabBarItem
        setupItems()
    }
    func setupItems(){
        let width : CGFloat = self.frame.size.width/CGFloat(self.tabBariItems.count);
        for i in 0..<tabBariItems.count {
            let item = tabBariItems[i]
            item.frame = CGRect(x: CGFloat(i)*width, y: 0, width: width, height: 49)
            self.addSubview(item)
            item.Itemdelegate = self
        }
    }
    
    func didSelecttabBarItemIndex(tabBarItem: TQTabBarItem, Index: Int) {
        if Bardelegate != nil{
            Bardelegate?.didtTabBarSelectItem(tab: self, item: tabBarItem, atIndex: Index)
        }
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}
