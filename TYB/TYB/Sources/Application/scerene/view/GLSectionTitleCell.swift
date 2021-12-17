//
//  GLSectionTitleCell.swift
//  TYB
//
//  Created by qsx on 2021/12/9.
//

import UIKit

class GLSectionTitleCell:  IFBaseTableViewCell {
    
    
    var title : String! {
        didSet{
            titleLabel.text = title
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    override func setupView() {
        super.setupView()
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalTo(20)
        }
    }
    
    
    private lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor.hexStringToUIColor(hex: "#323232", alpha: 0.6)
        label.font = kSystemFontRegular(size: 14)
        return label
    }()

}

