//
//  ToolsViewModel.swift
//  TYB
//
//  Created by qsx on 2021/12/9.
//

import UIKit
import RxSwift
import RxDataSources

enum ToolsViewCellModel {
    
    case item(ToolsModel)
    case margin(CGFloat)
    case title(String)
}


class ToolsViewModel: IFBaseViewModel {
    
    private let tbView : UITableView!
    
    private let dataSource : BehaviorSubject<[ToolsViewCellModel]> = BehaviorSubject(value: [])
    
    init(with tbView:UITableView) {
        self.tbView = tbView
        super.init()
        
        config()

    }
    private func config(){
        
        tbView.backgroundColor = .white
        tbView.register(ToolsTCell.self, forCellReuseIdentifier: ToolsTCell.reuseIdentifier)
        tbView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.reuseIdentifier)
        tbView.register(GLSectionTitleCell.self, forCellReuseIdentifier: GLSectionTitleCell.reuseIdentifier)
        tbView.separatorStyle = .none
//        tbView.rx.setDelegate(self).disposed(by: disposeBag)
        
        
        dataSource
            .bind(to: tbView.rx.items) { (tableView, row, element) in
                switch element{
                case ToolsViewCellModel.item (let item):
                    let cell = tableView.dequeueReusableCell(withIdentifier: ToolsTCell.reuseIdentifier) as! ToolsTCell
                    cell.item = item
                    cell.selectionStyle = .none
                    return cell
                case .margin(_):
                    let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.reuseIdentifier)!
                    cell.backgroundColor = .white
                    cell.selectionStyle = .none
                    return cell
                case .title(let title):
                    let cell = tableView.dequeueReusableCell(withIdentifier: GLSectionTitleCell.reuseIdentifier) as! GLSectionTitleCell
                    cell.title = title
                    cell.selectionStyle = .none
                    return cell
                }
            }
            .disposed(by: disposeBag)
        

        Observable.zip(tbView.rx.modelSelected(ToolsViewCellModel.self), tbView.rx.itemSelected).subscribe {[weak self] (cellModel,indexPath) in
            
            guard let `self` = self else {return}
            self.tbView.deselectRow(at: indexPath, animated: true)
            
            switch cellModel{
                    
                case .menu(_, let title):
                    self.handleMenuAction(title: title)
                default:
                    print("==========")
                    break
            }
            
        } onError: { (_) in
            
        }.disposed(by: disposeBag)
    }
    private func handleMenuAction(title:String){
        
//        switch title {
//        case "权限、蓝牙、GPS管理":
//            let vc = IFAuthorityManageViewController()
//            UIApplication.topViewController()?.present(UINavigationController.init(rootViewController: vc), animated: true, completion: nil)
//        case "意见反馈":
//            let vc = IFFeedbackViewController.init()
//            UIApplication.topNavigationController()?.pushViewController(vc, animated: true)
//        case "固件升级":
//            let vc = IFFirmwareUpgradeViewController.init()
//            UIApplication.topNavigationController()?.pushViewController(vc, animated: true)
//        case "APP版本":
//            let vc = IFAppInfoViewController()
//            UIApplication.topNavigationController()?.pushViewController(vc, animated: true)
//        default:
//            break
//        }
    }

    

}
