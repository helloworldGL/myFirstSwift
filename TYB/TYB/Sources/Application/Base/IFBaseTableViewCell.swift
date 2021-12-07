//
//  IFBaseTableViewCell.swift
//  yytxst
//
//  Created by 讯飞888 on 2020/8/12.
//  Copyright © 2020 讯飞888. All rights reserved.
//

import UIKit
import RxSwift

class IFBaseTableViewCell: UITableViewCell {

   // MARK: - Properties
    
    var disposeBag = DisposeBag()
    
    // MARK: - Con(De)structor
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        self.selectionStyle = .none

        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    // MARK: - Overridden: UITableViewCell
    

    // MARK: - Private methods
    
     func setupView() {
        
    }
}
