//
//  UIColor-Extensions.swift
//  GiTiny
//
//  Created by DongHeeKang on 29/12/2018.
//  Copyright © 2018 k-lpmg. All rights reserved.
//

import UIKit

extension UIColor {
    
    // MARK: - Properties
    
    static var defaultBlue: UIColor {
        return .init(red: 0/255.0, green: 122/255.0, blue: 255/255.0, alpha: 1.0)
    }
    static var gitHubBlue: UIColor {
        return .init(red: 39/255.0, green: 104/255.0, blue: 207/255.0, alpha: 1.0)
    }
    static var lightGray1: UIColor {
        return .init(red: 242/255.0, green: 245/255.0, blue: 254/255.0, alpha: 1.0)
    }
    static var lightGray2: UIColor {
        return .init(white: 230/255.0, alpha: 1.0)
    }
    static var lightBlack1: UIColor {
        return .init(white: 64/255.0, alpha: 1.0)
    }
    static var lightBlack2: UIColor {
        return .init(white: 51/255.0, alpha: 1.0)
    }
    static var lightBlack3: UIColor {
        return .init(white: 26/255.0, alpha: 1.0)
    }
    
    static var backGroundColor:UIColor {
        return HEXColor(clolrString: "F2F5FE")
    }
    static var backgroundColor:UIColor {
        return HEXColor(clolrString: "F2F5FE")
    }
    static var btnbackgroundColor:UIColor {
        return HEXColor(clolrString: "EFEFEF")
    }
    
    static var textColor:UIColor {
        return HEXColor(clolrString: "333333")
    }
    
    
    static var second_Color:UIColor {
        return HEXColor(clolrString: "666666")
    }
    
    static var third_Color:UIColor {
        return HEXColor(clolrString: "999999")
    }
    
    static var line_Color:UIColor {
        return HEXColor(clolrString: "DDDDDD")
    }
    
    
    // MARK: - Internal methods
    
    static func hexStringToUIColor(hex: String, alpha : CGFloat = 1.0) -> UIColor {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }
        if cString.count != 6 {
            return UIColor.gray
        }
        
        var rgbValue: UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}
