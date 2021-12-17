//
//  ToolsTCell.swift
//  TYB
//
//  Created by qsx on 2021/12/9.
//

import UIKit

class ToolsTCell: IFBaseTableViewCell {
    
    var item : ToolsModel! {
        didSet {
            titleLabel.text = item.name
            if let icon = item.icon {
                iconImageView.image = icon
                iconImageView.isHidden = false
                titleLabel.snp.makeConstraints { (make) in
                    make.centerY.equalToSuperview()
                    make.leading.equalTo(iconImageView.snp_trailing).offset(15)
                }
            }else{
                iconImageView.isHidden = true
                
                titleLabel.snp.remakeConstraints { (make) in
                    make.centerY.equalToSuperview()
                    make.leading.equalTo(20)
                }
            }
            
            if item.status == 1 {
                statusLabel.text = "已开启"
            }else{
                statusLabel.text = "未开启"
            }
        }
        
    }
    
    
    override func setupView() {
        super.setupView()
        
        contentView.addSubview(iconImageView)
        iconImageView.snp.makeConstraints { (make) in
            make.leading.equalTo(20)
            make.centerY.equalToSuperview()
        }
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalTo(iconImageView.snp_trailing).offset(15)
        }
        
        contentView.addSubview(accessoryImageView)
        accessoryImageView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(-20)
        }
        
        contentView.addSubview(statusLabel)
        statusLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(accessoryImageView.snp_leading).offset(-8)
        }
        
    }
    
    private lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor.hexStringToUIColor(hex: "#323232")
        label.font = kSystemFontRegular(size: 17)
        return label
    }()
    
    private lazy var iconImageView : UIImageView = {
        let img = UIImageView()
        return img
    }()
    
    private lazy var accessoryImageView : UIImageView = {
        let img = UIImageView()
        img.image = R.image.home_icon_accessory()
        return img
    }()
    
    
    private lazy var statusLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor.hexStringToUIColor(hex: "#323232",alpha: 0.6)
        label.font = kSystemFontRegular(size: 13)
        return label
    }()
}
