//
//  TQTabBarItem.swift
//  TQUBar
//
//  Created by admin on 2022/4/1.
//

import UIKit
import Lottie

protocol TQTabBarItemDelegate : NSObjectProtocol{
    func didSelecttabBarItemIndex(tabBarItem : TQTabBarItem,Index:Int)
}

class TQTabBarItem: UIView {
    open weak var Itemdelegate : TQTabBarItemDelegate?
    lazy var animationView : LOTAnimationView = {
        let aview = LOTAnimationView()
        aview.contentMode = .scaleAspectFit
        return aview
    }()
    
    public let unreadCount = CustomBtn(font: .systemFont(ofSize: 12), color: 0xffffff, bcolor: 0xff4d73,edge: 1.5,lineBreakMode: .byTruncatingTail)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(animationView)
        self.addSubview(unreadCount)
        self.isUserInteractionEnabled = true
        let tap : UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(tapItem(ger:)))
        animationView.addGestureRecognizer(tap)
        unreadCount.backgroundColor = UIColorFromRGB(rgbValue: 0xff4d73)
        unreadCount.layer.cornerRadius = 8
        unreadCount.layer.masksToBounds = true
        unreadCount.isUserInteractionEnabled = false
        unreadCount.isHidden = true
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        var rect : CGRect = self.frame
        rect.origin.x = 0
        //rect.origin.y = -35
        //rect.size.height += 20
        let islong = (readCount != nil && readCount.count >= 2)
        self.animationView.frame = rect
        rect.size.height = 16
        rect.origin.y = 8
        rect.origin.x += rect.size.width/2 + (islong ? 2.5 : 5)
        rect.size.width = islong ? 24 : 18
        unreadCount.frame = rect
    }
    
    @objc func tapItem(ger:UIGestureRecognizer?=nil){
        if Itemdelegate != nil{
            Itemdelegate?.didSelecttabBarItemIndex(tabBarItem: self, Index: self.tag)
        }
    }
    
    var readCount : String!{
        didSet{
            if readCount == "0"{
                unreadCount.isHidden = true
            }else{
                unreadCount.isHidden = false
                if readCount.count > 2{
                    unreadCount.setTitle("⋯", for: .normal)
                }else{
                    unreadCount.setTitle(readCount, for: .normal)
                }
            }
            layoutSubviews()
        }
    }
    
    func setAnimationJsonName(animationJsonName : String){
        self.animationView.setAnimation(named: animationJsonName)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

