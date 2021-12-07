//
//  IFBaseView.swift
//  yytxst
//
//  Created by 讯飞888 on 2020/8/12.
//  Copyright © 2020 讯飞888. All rights reserved.
//

import UIKit
import RxSwift
class IFBaseView: UIView {

    var disposeBag = DisposeBag()

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup() {
        
    }
    
    deinit {
        print("\(self) deinit")
    }
    


}
