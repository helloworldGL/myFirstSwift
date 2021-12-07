//
//  UIImage+IFExtention.swift
//  yytxst
//
//  Created by 讯飞888 on 2020/9/7.
//  Copyright © 2020 讯飞888. All rights reserved.
//

import UIKit


extension UIImage{
    
    func grayedImage() -> UIImage? {
        let context = CIContext(options: nil)
        guard let currentFilter = CIFilter(name: "CIPhotoEffectNoir") else { return nil }
        currentFilter.setValue(CIImage(image: self), forKey: kCIInputImageKey)
        if let output = currentFilter.outputImage,
            let cgImage = context.createCGImage(output, from: output.extent) {
            return UIImage(cgImage: cgImage, scale: scale, orientation: imageOrientation)
        }
        return nil
    }
}
