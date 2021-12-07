//
//  YTabBarBoard.swift
//  TuoYouBao
//
//  Created by 郭令 on 2021/11/11.
//

import UIKit
import Foundation
import Differentiator

class YTabBarBoard: UITabBarController {

    // 创建TabBar数组
    // 创建TabBar数组
    var tabs = ["", "优托", "优育","优享","我的"]
    var images = ["tuo-you-bao_n", "you_tuo_n", "you_yu_n","you_xiang_n","wo_de_n"]
    var selectedImages = ["tuo-you-bao_s", "you_tuo_s", "you_yu_s","you_xiang_s","wo_de_s"]
    
    public var tabBarItems:[UITabBarItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.toMain()
    }
    
    func toMain() {
        
        let boardArr = [FirstBoard(),SecondBoard(),ThirdBoard(),FourBoard(),MyBoard()]
        var navArray:[UIViewController] = [UIViewController]()
        var i = 0
        while i<images.count {
            
            // 改变图片 保证图片不失真
            let normalImage = UIImage(named:images[i])?.withRenderingMode(.alwaysOriginal)
            let selectImage = UIImage(named:selectedImages[i])?.withRenderingMode(.alwaysOriginal)
            let board: UIViewController = boardArr[i]
            let boardNC = UINavigationController.init(rootViewController: board)
            
            let item = UITabBarItem.init(title: tabs[i], image: normalImage, selectedImage: selectImage)
            boardNC.tabBarItem = item
            
            
            //此方法在 iOS 13 会有 bug，当我们 push 到下一页再次返回时 tabbar 字体颜色设置会失效。
//            item.setTitleTextAttributes(
//                [NSAttributedString.Key.foregroundColor: gl_third_Color], for: .normal)
//            item.setTitleTextAttributes(
//                [NSAttributedString.Key.foregroundColor: gl_redColor], for: .selected)
            //tarbar的字体大小
            item.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)], for: .normal)
            //隐藏系统的navigationBar
            boardNC.setNavigationBarHidden(true, animated: true)

            navArray.append(boardNC)
            i+=1
            print(i)
            tabBarItems.append(board.tabBarItem)
        }
        
        
        self.tabBar.tintColor = gl_redColor

//        let tabBarController = UITabBarController()
        self.viewControllers = navArray
        self.tabBar.backgroundColor = .groupTableViewBackground
        self.selectedIndex = 1
        
        print(navArray)
//        AppDelegate.init().window?.rootViewController = self
    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        //获取选中的item
        let tabIndex = tabBar.items?.firstIndex(of: item)
        let item_0:UITabBarItem = tabBar.items![0]
        item_0.title = ""
        item.title = tabs[tabIndex!]
        if tabIndex == 0 {
            item.title = "托幼宝"
        }

    }
    
}
