//
//  UIApplication-Extensions.swift
//  GiTiny
//
//  Created by DongHeeKang on 21/02/2019.
//  Copyright © 2019 k-lpmg. All rights reserved.
//

import UIKit

extension UIApplication {
    
    func refresh() {
        windows.forEach({ (window) in
            window.subviews.forEach({ (view) in
                view.removeFromSuperview()
                window.addSubview(view)
            })
        })
    }
    
    
    func frontWindow() -> UIWindow {
        return (UIApplication.shared.delegate as! AppDelegate).window!
    }
    

    
    //获取目前页面顶层viewController
    static func topViewController() -> UIViewController? {
        return self.topViewController(root: UIApplication.shared.frontWindow().rootViewController)
    }
    
    
    static func topViewController(root: UIViewController?) -> UIViewController? {
        if root is UINavigationController {
            let nav = root as! UINavigationController
            return self.topViewController(root:nav.viewControllers.last)
        }
        if root is UITabBarController {
            let tab = root as! UITabBarController
            return self.topViewController(root:tab.selectedViewController)
        }
        if root?.presentedViewController != nil {
            return self.topViewController(root:root?.presentedViewController)
        }
        return root
    }
    
    static func topNavigationController() -> UINavigationController?{
        let vc = self.topViewController()
        if let nav = vc?.navigationController {
            return nav
        }
        if let _ = vc?.presentingViewController {
            vc?.dismiss(animated: false, completion: nil)
        }
        return self.topNavigationController()
    }
    
}
