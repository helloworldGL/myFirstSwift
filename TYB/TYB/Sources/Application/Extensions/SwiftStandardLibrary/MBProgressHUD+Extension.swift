//
//  MBProgressHUD+Extension.swift
//  yytxst
//
//  Created by 讯飞888 on 2020/8/19.
//  Copyright © 2020 讯飞888. All rights reserved.
//

import UIKit
import MBProgressHUD

extension MBProgressHUD {
   // 开启loading
    static func showHudForView(view: UIView,isCover:Bool = true) -> MBProgressHUD {
        for subView in view.subviews {
            if subView is MBProgressHUD {
                (subView as! MBProgressHUD).hide(animated: false)
            }
        }
       
        let hud = MBProgressHUD.init(view: view)
        hud.tag = UserDefaultsKey.KMBProgressHubTag
        hud.removeFromSuperViewOnHide = true
        hud.mode = .indeterminate
//        hud.mode = MBProgressHUDMode.customView
        hud.isUserInteractionEnabled = !isCover
//        let loadingView = MMLoadingCircleView.init(frame: CGRect.init(x: 0, y: 0, width: kLoadingWidth, height: kLoadingWidth))
//        hud.customView = loadingView
//        hud.customView?.snp.makeConstraints({ (make) in
//            make.width.height.equalTo(kLoadingWidth)
//        })
//        hud.bezelView.style = MBProgressHUDBackgroundStyle.solidColor
//        hud.bezelView.color = UIColor.clear
//        hud.minSize = CGSize.init(width: kLoadingWidth, height: kLoadingWidth)
        view.addSubview(hud)
        hud.show(animated: true)
//        loadingView.startAnimation()
        return hud
    }
    
    // 关闭loading
    static func hideHUDForView(view: UIView) {
        MBProgressHUD.hide(for: view, animated: true)
    }
}
