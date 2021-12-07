//
//  UIResponder+Extension.swift
//  yytxst
//
//  Created by 讯飞888 on 2020/9/27.
//  Copyright © 2020 讯飞888. All rights reserved.
//

import Foundation
import UIKit

let kConversationSubScene = "kConversationSubScene"

/**
 通过 事件响应链，跨层级传递数据
 */
extension UIResponder {
    
   @objc func router(withEventName name:String,info : Any?) -> Any?{
        if (self.next != nil) {
            return self.next?.router(withEventName: name, info: info)
        }
        return nil
    }
}
