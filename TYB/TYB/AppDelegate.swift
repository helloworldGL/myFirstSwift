//
//  AppDelegate.swift
//  TuoYouBao
//
//  Created by 郭令 on 2021/11/9.
//

import UIKit
import Kingfisher
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    // 创建TabBar数组
    var tabs = ["优托", "优享", "我的"]
    var images = ["aa", "bb", "cc"]
    var selectedImages = ["eee", "fff", "ggg"]
    
 

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        self.toMain()
        
        self.founcation()//键盘的自动收回

        self.window!.makeKeyAndVisible()

        return true
    }

    func toLogin() {
        
        window?.rootViewController = UINavigationController.init(rootViewController:  LoginBoard())

    }
    
    func toMain() {
        
        let itemsViewControler: YTabBarBoard = YTabBarBoard()
        window?.rootViewController = itemsViewControler
        window?.makeKeyAndVisible()
    }
    
    private func founcation() {
        
        //控制整个功能是否启用。
        IQKeyboardManager.shared.enable = true
        //控制点击背景是否收起键盘
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        //控制键盘上的工具条文字颜色是否用户自定义
        IQKeyboardManager.shared.shouldShowToolbarPlaceholder = true
        //       IQKeyboardManager.sharedManager().shouldToolbarUsesTextFieldTintColor = true
        //将右边Done改成完成
        IQKeyboardManager.shared.toolbarDoneBarButtonItemText = "完成"
        // 控制是否显示键盘上的工具条
        IQKeyboardManager.shared.enableAutoToolbar = true
        //最新版的设置键盘的returnKey的关键字 ,可以点击键盘上的next键，自动跳转到下一个输入框，最后一个输入框点击完成，自动收起键盘
        IQKeyboardManager.shared.toolbarManageBehaviour = .byPosition
        
    }
}

