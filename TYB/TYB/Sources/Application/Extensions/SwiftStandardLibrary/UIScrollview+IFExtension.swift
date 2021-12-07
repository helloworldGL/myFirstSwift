//
//  IFExtension.swift
//  yytxst
//
//  Created by 讯飞888 on 2020/8/27.
//  Copyright © 2020 讯飞888. All rights reserved.
//

import UIKit
import DZNEmptyDataSet
private var kRequestStatusType = "kRequestStatusType"


enum IFRequestStatusType: Int {
    case normal = 0// 请求成功无数据
    case loading // 重新请求
    case failure // 请求失败
    case noNetwork // 无网络
    case locationFailed  //定位失败
}

extension UIScrollView  {
    

    
    var requestStatusType: IFRequestStatusType {
        get {
            if objc_getAssociatedObject(self, &kRequestStatusType) != nil,let type = (objc_getAssociatedObject(self, &kRequestStatusType) as? IFRequestStatusType) {
                return type
            }
            return .normal
        }
        set {
            objc_setAssociatedObject(self, &kRequestStatusType, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            if self is UICollectionView{
                (self as! UICollectionView).reloadData()
            }else if self is UITableView{
                (self as! UITableView).reloadData()
            }else {
                self.reloadEmptyDataSet()
            }
        }
    }
    
}
