//
//  File.swift
//  GoToSchool-Student
//
//  Created by Improve on 2018/3/30.
//  Copyright © 2018年 Improve. All rights reserved.
//

import UIKit


//统计学习时长
var workBegainTimestamp:Double!

// Appdelegate
let AppdelegateMacro:AppDelegate = UIApplication.shared.delegate as! AppDelegate
// 测评根路径
let shareBaseURL:String = "https://app-test-h5.qsx001.com"
// 每日一练/项目根路径
let BaseServerURL:String = "https://app-test-h5.qsx001.com"

//屏幕尺寸
let kScreenWidth = UIScreen.main.bounds.size.width
let kScreenHeight = UIScreen.main.bounds.size.height

//当前时间 年- 月- 日


//设置基础颜色
let gl_textColor = HEXColor(clolrString: "333333")
let gl_second_Color = HEXColor(clolrString: "666666")
let gl_third_Color = HEXColor(clolrString: "999999")
let gl_line_Color = HEXColor(clolrString: "DDDDDD")

let gl_blueColor = RGBAArrayColor(rgbaArray: [0,157,255])
let gl_redColor = RGBAArrayColor(rgbaArray: [254,122,151])

let gl_budgeRed_Color = HEXColor(clolrString: "F75050")

// MARK: -------- 宽高比 -----------
let horizontalRate = kScreenWidth/375
let verticalrate =  kScreenHeight/666

// iPhone X
func isIPhoneXType() -> Bool {
    guard #available(iOS 11.0, *) else {
        return false
    }
    return UIApplication.shared.windows.first?.safeAreaInsets.bottom != 0
}

//获取当前控制器

func CurrentVC() ->UIViewController? {
    
    var vc = UIApplication.shared.keyWindow?.rootViewController
    if ((vc?.isKind(of: UITabBarController.self)) != nil) {
        vc = (vc as! UITabBarController).selectedViewController
    }else if ((vc?.isKind(of: UINavigationController.self)) != nil) {
        vc = (vc as! UINavigationController).visibleViewController
    }else if ((vc?.isKind(of: UITabBarController.self)) != nil) {
        vc = vc?.presentedViewController
    }
    return vc
}

func afterDecimals(value: Int) -> String {
     let intVal  = value / 10000
     let doubleVal = value % 10000
     let suffixValue = doubleVal / 1000
     let newValue = "\(intVal)" + "." + "\(suffixValue)" + "w"
     return newValue
}

/**
     获取日期信息
     - parameter i: 传参为今天开始的第几天 今天为0， 明天为1， -1则代表昨天 以此类推
     - return    时间信息
 */
func getDateInfo(i: Int) -> (yearStr: String, monthStr: String, dayStr: String) {
    
    //获取当前时间
    let cuurentDate = Date.init()
    //对自己需要的时间进行处理
    let needTime: TimeInterval = TimeInterval(i * (24*60*60))
    let needDate = cuurentDate.addingTimeInterval(needTime)
    
    //格式化
    let yearFormatter = DateFormatter()
    yearFormatter.dateFormat = "yyyy"
    let monthFormatter = DateFormatter()
    monthFormatter.dateFormat = "MM"
    let dayFormatter = DateFormatter()
    dayFormatter.dateFormat = "dd"
    
    let year = yearFormatter.string(from: needDate)
    let month = monthFormatter.string(from: needDate)
    let day = dayFormatter.string(from: needDate)
    return (year, month, day)
}


// 尺寸比例
func kCurrentScale(_ a:CGFloat) -> CGFloat {
    var floatValue:CGFloat = kScreenWidth / 375 * a
    floatValue = CGFloat(Int(floatValue))//10.0
    return floatValue
}

//图片
func kImage(_ imageName: String) -> UIImage? {
    if imageName.isEmpty {
        return nil
    }
    let img = UIImage(named: imageName)
    if img?.size.width == 0 || img?.size.height == 0 {
        return nil
    }
    return img
}


//时间格式
func ktime(_ timeFormtter:String,time:String) -> NSDate {
    //创建一个DateFormatter来作为转换的桥梁
    let dateFormatter = DateFormatter()
    //设置转换格式
    dateFormatter.dateFormat = timeFormtter
    //按照转换格式设置时间（月份缩写 日期 年 时区代码（GMT指格林威治时间，相当于零时区））
    let str = time
    //进行转换
    let newDate = dateFormatter.date(from: str)
    return newDate! as NSDate
    
}

//字体
//func kFontSize(_ a:CGFloat) -> CGFloat {
//    return a * kScreenWidth / 375 * 0.9
//}
func RGBAArrayColor(rgbaArray:[CGFloat])-> UIColor{
    let color:UIColor!
    if (rgbaArray.count == 4) {
        color = UIColor.init(red: rgbaArray[0]/255.0, green: rgbaArray[1]/255.0, blue: rgbaArray[2]/255.0, alpha:rgbaArray[3])
    }else{
       color = UIColor.init(red: rgbaArray[0]/255.0, green: rgbaArray[1]/255.0, blue: rgbaArray[2]/255.0, alpha:1)
    }
    return color
}
//16进制颜色 //用数值初始化颜色，便于生成设计图上标明的十六进制颜色
//func HEXColor(valueRGB: UInt,alpha: CGFloat) -> UIColor {
//    return UIColor.init(red: CGFloat((valueRGB & 0xFF0000) >> 16) / 255.0, green: CGFloat((valueRGB & 0x00FF00) >> 8) / 255.0, blue: CGFloat(valueRGB & 0x0000FF) / 255.0, alpha:alpha)
//    //let components = solid.colorHex.hexColorComponents()
//    //self.colorProperty = NodeProperty(provider: SingleValueProvider(Color(r: Double(components.red), g: Double(components.green), b: Double(components.blue), a: 1)))
//}

func HEXColor(clolrString:String) -> UIColor {
    
    if clolrString.contains("#") {
        let color = UIColor.hexStringToUIColor(hex: clolrString)
        return color
    }
    let color = UIColor.hexStringToUIColor(hex: "#" + clolrString)
    return color
}

//尺寸
func gl_font(font:CGFloat) -> UIFont {
    
    return UIFont.systemFont(ofSize: CGFloat(font))
}



//PingFang-SC-Heavy
func kSystemFontHeavy(size: CGFloat) -> UIFont {
    let font: UIFont = UIFont.systemFont(ofSize: size, weight: .heavy)
    return font
}

func kSystemFontUltraLight(size: CGFloat) -> UIFont {
    let font: UIFont = UIFont.systemFont(ofSize: size, weight: .ultraLight)
    return font
}

func kSystemFontThin(size: CGFloat) -> UIFont {
    let font: UIFont = UIFont.systemFont(ofSize: size, weight: .thin)
    return font
}

func kSystemFontLight(size: CGFloat) -> UIFont {
    let font: UIFont = UIFont.systemFont(ofSize: size, weight: .light)
    return font
}

func kSystemFontRegular(size: CGFloat) -> UIFont {
    let font: UIFont = UIFont.systemFont(ofSize: size, weight: .regular)
    return font
}

func kSystemFontMedium(size: CGFloat) -> UIFont {
    let font: UIFont = UIFont.systemFont(ofSize: size, weight: .medium)
    return font
}

func kSystemFontSemibold(size: CGFloat) -> UIFont {
    let font: UIFont = UIFont.systemFont(ofSize: size, weight: .semibold)
    return font
}

func kSystemFontBold(size: CGFloat) -> UIFont {
    let font: UIFont = UIFont.systemFont(ofSize: size, weight: .bold)
    return font
}

func kSystemFontBlack(size: CGFloat) -> UIFont {
    let font: UIFont = UIFont.systemFont(ofSize: size, weight: .black)
    return font
}


