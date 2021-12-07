//
//  String-Extensions.swift
//  GiTiny
//
//  Created by DongHeeKang on 27/12/2018.
//  Copyright © 2018 k-lpmg. All rights reserved.
//

import Foundation
import CommonCrypto

extension String {
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    
    func md5() -> String {
        let cStr = self.cString(using: String.Encoding.utf8)
        let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: 16)
        CC_MD5(cStr!,(CC_LONG)(strlen(cStr!)), buffer)
        let md5String = NSMutableString();
        for i in 0 ..< 16{
            md5String.appendFormat("%02x", buffer[i])
        }
        free(buffer)
        return md5String as String
    }
}

