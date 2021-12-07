//
//  Array+Extension.swift
//  yytxst
//
//  Created by 讯飞888 on 2020/8/13.
//  Copyright © 2020 讯飞888. All rights reserved.
//

import UIKit

extension Array {
    subscript(safe idx: Int) -> Element? {
        return idx < endIndex ? self[idx] : nil
    }
    
    func toJsonString() -> String? {
        guard let data = try? JSONSerialization.data(withJSONObject: self, options: []) else {
            return nil
        }
        return String(data: data, encoding: String.Encoding.utf8)
    }
}
