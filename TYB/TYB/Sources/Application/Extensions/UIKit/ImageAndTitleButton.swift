//
//  ImageAndTitleButton.swift
//  TYB
//
//  Created by qsx on 2021/11/23.
//

import UIKit

class ImageAndTitleButton: UIButton {

    //图片和title
    var imageView_extern: UIImageView?
    var titleLabel_extern: UILabel?
    var location: Int? = 0
    var space: Float = 5.0

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(frame: CGRect,iconImage: UIImage?,title:String?,font:UIFont?,textColor:UIColor?,location:Int?,space:CGFloat = 5.0) {
        self.init(frame: frame)
        self.location = location
        
        let iconImageV:UIImageView = UIImageView.init()
        iconImageV.image = iconImage
        self.addSubview(iconImageV)
        self.imageView_extern = iconImageV
        
        iconImageV.contentMode = UIView.ContentMode.center
        
        let titleLab = UILabel.init()
        self.addSubview(titleLab)
        titleLab.textColor = textColor
        titleLab.text = title
        titleLab.font = font
        titleLab.textAlignment = .left
        self.titleLabel_extern = titleLab

        
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
        
    }
    
//    func resetUI(){
//
//        let iconImageV:UIImageView = UIImageView.init()
//        iconImageV.image = iconImage
//        button.addSubview(iconImageV)
//
//        iconImageV.contentMode = UIView.ContentMode.center
//
//        let titleLab = UILabel.init()
//        button.addSubview(titleLab)
//        titleLab.textColor = textColor
//        titleLab.text = title
//        titleLab.font = font
//        titleLab.textAlignment = .center
//        switch location {
//            case 0://图片在上
//                iconImageV.snp.makeConstraints { make in
//                    make.left.right.top.equalTo(0)
//                }
//                titleLab.snp.makeConstraints { make in
//                    make.left.right.bottom.equalTo(0)
//                    make.top.equalTo(iconImageV.snp.bottom).offset(space)
//                }
//            case 1://图片在左
//                iconImageV.snp.makeConstraints { make in
//                    make.left.bottom.top.equalTo(0)
//                }
//                titleLab.snp.makeConstraints { make in
//                    make.top.right.bottom.equalTo(0)
//                    make.left.equalTo(iconImageV.snp.right).offset(space)
//                }
//
//            case 2://图片在下
//                iconImageV.snp.makeConstraints { make in
//                    make.left.bottom.right.equalTo(0)
//                }
//                titleLab.snp.makeConstraints { make in
//                    make.top.right.left.equalTo(0)
//                    make.bottom.equalTo(iconImageV.snp.top).offset( 0 - space)
//                }
//            case 3://图片在右
//                iconImageV.snp.makeConstraints { make in
//                    make.right.bottom.top.equalTo(0)
//                }
//                titleLab.snp.makeConstraints { make in
//                    make.top.left.bottom.equalTo(0)
//                    make.right.equalTo(iconImageV.snp.left).offset(0 - space)
//                }
//            default:
//                print("")
//        }
//
//
//    }
    
    
}
