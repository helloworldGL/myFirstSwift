//
//  SecondBoard.swift
//  TYB
//
//  Created by qsx on 2021/12/7.
//

import UIKit
import RxCocoa

//MARK: - JmoVxia---类-属性
class SecondBoard: BaseViewController {
    
    lazy var homeTabView:UITableView = {
        
        let v = UITableView.init(frame: .zero, style: .grouped)
        v.separatorStyle = .none
        return v
        
    }()
    //头部试图
    private lazy var headerView : UIView = {
        let header =  UIView.init(frame: CGRect.init(x: 0, y: 0, width: view.width, height: 34 + 128 + 11 + 20 + 26))
    
        
        let logo = UIImageView.init(image: R.image.authority_icon())
        header.addSubview(logo)
        logo.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(34)
            make.size.equalTo(CGSize.init(width: 128, height: 128))
            
        }
        
        let titleLabel = UILabel()
        titleLabel.text = "我们需要您的允许后才能正常使用哦"
        titleLabel.textColor = UIColor.hexStringToUIColor(hex: "#2C2C2C")
        titleLabel.font = kSystemFontRegular(size: 14)
        header.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(logo.snp_bottom).offset(11)
        }
        
        return header
    
    }()
    
    
    private var viewModel : ToolsViewModel!

    
}
//MARK: - JmoVxia---生命周期
extension SecondBoard {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLab_gl.text = "Tools"
        self.leftBtn_gl.isHidden = true
        self.initUI()

    }
}
//MARK: - JmoVxia---布局
extension SecondBoard {
    
    func initUI() {
        view.addSubview(homeTabView)
        homeTabView.tableFooterView = headerView
        homeTabView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(0)
            make.top.equalTo(bar_gl.snp_bottom).offset(10)
        }
    }
    
    func bindViewModel() {
        viewModel = ToolsViewModel.init(with: homeTabView)
    }

}
//MARK: - JmoVxia---数据
extension SecondBoard {}
//MARK: - JmoVxia---代理方法
//extension SecondBoard:UITableViewDelegate,UITableViewDataSource {
//
//    
//}
//MARK: - JmoVxia---override
extension SecondBoard {}
//MARK: - JmoVxia---私有方法
extension SecondBoard {}
//MARK: - JmoVxia---公共方法
extension SecondBoard {}

