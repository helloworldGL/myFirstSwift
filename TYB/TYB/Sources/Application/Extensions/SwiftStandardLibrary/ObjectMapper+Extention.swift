//
//  ObjectMapper+Extention.swift
//  yytxst
//
//  Created by 讯飞888 on 2020/8/18.
//  Copyright © 2020 讯飞888. All rights reserved.
//

import UIKit
import ObjectMapper

class TransIntAndBoolHandler: TransformType {
    func transformFromJSON(_ value: Any?) -> Bool? {
        guard let intValue = value as? Int else{
            return nil
        }
        if intValue <= 0 {
            return false
        }else {
            return true
        }
    }
    
    func transformToJSON(_ value: Bool?) -> Int? {
        if value == nil {
            return nil
        }
        if value == true {
            return 1
        }else {
            return 0
        }
    }
    
    typealias Object = Bool
    typealias JSON = Int
}
