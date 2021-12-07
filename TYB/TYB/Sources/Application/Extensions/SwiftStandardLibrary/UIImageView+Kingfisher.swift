//
//  UIImageView+Kingfisher.swift
//  yytxst
//
//  Created by 讯飞888 on 2020/8/14.
//  Copyright © 2020 讯飞888. All rights reserved.
//

import Foundation
import Kingfisher


extension UIImageView {
    
    
    func downloadImage(with urlString:String, placeholder imageName: UIImage? = nil,completion:((UIImage?)->())? = nil) {
        
        KingfisherManager.shared.downloader.trustedHosts = Set(["xfxst-test.oss-cn-hangzhou.aliyuncs.com"])
        
        self.kf.setImage(with: URL.init(string: urlString), placeholder: imageName, completionHandler:  { (result) in
            
            if let com = completion{
                switch result{
                case .success(let value):
                    com(value.image)
                case .failure(let error):
                    com(nil)
                    print("downloadImage failed: \(error.localizedDescription)")
                }
            }
        })
    }
    
}
