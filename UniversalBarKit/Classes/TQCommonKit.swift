//
//  TQCommonKit.swift
//  TQUBar
//
//  Created by admin on 2022/4/1.
//

import Foundation
import UIKit

func CustomBtn(font : UIFont?=nil,color : NSInteger?=nil, bcolor : NSInteger?=nil, edge:CGFloat?=nil,lineBreakMode : NSLineBreakMode? = nil) -> UIButton{
    let btn = UIButton()
    if font != nil{
        btn.titleLabel?.font = font!
    }
    if color != nil{
        btn.setTitleColor(UIColorFromRGB(rgbValue: color!), for: .normal)
    }
    if bcolor != nil{
        btn.backgroundColor = UIColorFromRGB(rgbValue: bcolor!)
    }
    if edge != nil{
        btn.contentEdgeInsets = UIEdgeInsets(top: 0, left: edge!, bottom: 0, right: edge!)
    }
    if lineBreakMode != nil{
        btn.titleLabel?.lineBreakMode = lineBreakMode!
    }
    return btn
}
func UIColorFromRGB(rgbValue:Int) -> UIColor {
    return UIColor.init(_colorLiteralRed:((Float)((rgbValue & 0xFF0000) >> 16))/255.0, green: ((Float)((rgbValue & 0xFF00) >> 8))/255.0, blue: ((Float)(rgbValue & 0xFF))/255.0 , alpha: 1.0)
}
