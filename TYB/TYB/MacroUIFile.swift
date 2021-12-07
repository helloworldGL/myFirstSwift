//
//  MacroUIFile.swift
//  TYB
//
//  Created by qsx on 2021/11/18.
//

import Foundation
import SnapKit
import UIKit

//带星星的lable
func starLable(title: String,font: UIFont,textColor:UIColor) -> UIView {
    
    let view:UIView = UIView.init()
    
    let starLab = UILabel.init()
    view.addSubview(starLab)
    starLab.snp.makeConstraints { make in
        make.left.equalTo(0)
        make.centerY.equalTo(view)
    }
    starLab.textColor = .red
    starLab.text = "*"
    starLab.font = font
    
    let textLab = UILabel.init()
    view.addSubview(textLab)
    textLab.snp.makeConstraints { make in
        make.right.top.bottom.equalTo(0)
        make.centerY.equalTo(view)
        make.left.equalTo(starLab.snp.right).offset(3)
    }
    textLab.textColor = textColor
    textLab.text = title
    textLab.font = font
    
    return view
}

func glButton(iconImage: UIImage?,title:String?,font:UIFont?,textColor:UIColor?,location:Int?) -> UIButton {
    
    let button:UIButton = UIButton.init()
    let iconImageV:UIImageView = UIImageView.init()
    iconImageV.image = iconImage
    button.addSubview(iconImageV)
    
    iconImageV.contentMode = UIView.ContentMode.center
    
    let titleLab = UILabel.init()
    button.addSubview(titleLab)
    titleLab.textColor = textColor
    titleLab.text = title
    titleLab.font = font
    titleLab.textAlignment = .center

    let space = 5.0
    switch location {
        case 0://图片在上
            iconImageV.snp.makeConstraints { make in
                make.left.right.top.equalTo(0)
            }
            titleLab.snp.makeConstraints { make in
                make.left.right.bottom.equalTo(0)
                make.top.equalTo(iconImageV.snp.bottom).offset(space)
            }
        case 1://图片在左
            iconImageV.snp.makeConstraints { make in
                make.left.bottom.top.equalTo(0)
            }
            titleLab.snp.makeConstraints { make in
                make.top.right.bottom.equalTo(0)
                make.left.equalTo(iconImageV.snp.right).offset(space)
            }
            
        case 2://图片在下
            iconImageV.snp.makeConstraints { make in
                make.left.bottom.right.equalTo(0)
            }
            titleLab.snp.makeConstraints { make in
                make.top.right.left.equalTo(0)
                make.bottom.equalTo(iconImageV.snp.top).offset( 0 - space)
            }
        case 3://图片在右
            iconImageV.snp.makeConstraints { make in
                make.right.bottom.top.equalTo(0)
            }
            titleLab.snp.makeConstraints { make in
                make.top.left.bottom.equalTo(0)
                make.right.equalTo(iconImageV.snp.left).offset(0 - space)
            }
        default:
            print("")
    }
    return button
}

func showGifImageView(resource:String) -> UIImageView {
    
    let imageView = UIImageView.init()
    
    let url = Bundle.main.url(forResource: resource, withExtension: "gif")
    guard let imageData = NSData(contentsOf: url!) else {
        return imageView
    }
    // 从data中读取数据: 将data转成CGImageSource对象
    guard let imageSource = CGImageSourceCreateWithData(imageData, nil) else { return imageView }
    let imageCount = CGImageSourceGetCount(imageSource)
    
    // 便利所有的图片
    var images = [UIImage]()
    var totalDuration : TimeInterval = 0
    for i in 0..<imageCount {
        // .取出图片
        guard let cgImage = CGImageSourceCreateImageAtIndex(imageSource, i, nil) else { continue }
        let image = UIImage(cgImage: cgImage)
        if i == 0 {
            imageView.image = image
        }
        images.append(image)
        
        // 取出持续的时间
        guard let properties = CGImageSourceCopyPropertiesAtIndex(imageSource, i, nil) else { continue }
        guard let gifDict = (properties as NSDictionary)[kCGImagePropertyGIFDictionary] as? NSDictionary else { continue }
        guard let frameDuration = gifDict[kCGImagePropertyGIFDelayTime] as? NSNumber else { continue }
        totalDuration += frameDuration.doubleValue
    }
    
    // 设置imageView的属性
    imageView.animationImages = images
    imageView.animationDuration = totalDuration
    imageView.animationRepeatCount = 0
    
    // 开始播放
    imageView.startAnimating()
    
    
    return imageView
    
}


func glButton_space(iconImage: UIImage?,title:String?,font:UIFont?,textColor:UIColor?,location:Int?,space:CGFloat) -> UIButton {
    
    let button:UIButton = UIButton.init()
    let iconImageV:UIImageView = UIImageView.init()
    iconImageV.image = iconImage
    button.addSubview(iconImageV)
    
    iconImageV.contentMode = UIView.ContentMode.center
    
    let titleLab = UILabel.init()
    button.addSubview(titleLab)
    titleLab.textColor = textColor
    titleLab.text = title
    titleLab.font = font
    titleLab.textAlignment = .center
    switch location {
        case 0://图片在上
            iconImageV.snp.makeConstraints { make in
                make.left.right.top.equalTo(0)
            }
            titleLab.snp.makeConstraints { make in
                make.left.right.bottom.equalTo(0)
                make.top.equalTo(iconImageV.snp.bottom).offset(space)
            }
        case 1://图片在左
            iconImageV.snp.makeConstraints { make in
                make.left.bottom.top.equalTo(0)
            }
            titleLab.snp.makeConstraints { make in
                make.top.right.bottom.equalTo(0)
                make.left.equalTo(iconImageV.snp.right).offset(space)
            }
            
        case 2://图片在下
            iconImageV.snp.makeConstraints { make in
                make.left.bottom.right.equalTo(0)
            }
            titleLab.snp.makeConstraints { make in
                make.top.right.left.equalTo(0)
                make.bottom.equalTo(iconImageV.snp.top).offset( 0 - space)
            }
        case 3://图片在右
            iconImageV.snp.makeConstraints { make in
                make.right.bottom.top.equalTo(0)
            }
            titleLab.snp.makeConstraints { make in
                make.top.left.bottom.equalTo(0)
                make.right.equalTo(iconImageV.snp.left).offset(0 - space)
            }
        default:
            print("")
    }
    return button
}

//给富文本做扩展  --- 字符串扩展
extension String{
/// 富文本设置 字体大小 行间距 字间距
    func attributedString(font: UIFont, textColor: UIColor, lineSpaceing: CGFloat, wordSpaceing: CGFloat) -> NSAttributedString {
        
        let style = NSMutableParagraphStyle()
        style.lineSpacing = lineSpaceing
        let attributes = [
                NSAttributedString.Key.font             : font,
                NSAttributedString.Key.foregroundColor  : textColor,
                NSAttributedString.Key.paragraphStyle   : style,
                NSAttributedString.Key.kern             : wordSpaceing]
            
            as [NSAttributedString.Key : Any]
        let attrStr = NSMutableAttributedString.init(string: self, attributes: attributes)
        
        // 设置某一范围样式
        // attrStr.addAttribute(<#T##name: NSAttributedString.Key##NSAttributedString.Key#>, value: <#T##Any#>, range: <#T##NSRange#>)
        return attrStr
    }
}
