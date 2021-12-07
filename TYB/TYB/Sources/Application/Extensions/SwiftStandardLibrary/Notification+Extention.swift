//
//  Notification+Extention.swift
//  yytxst
//
//  Created by 讯飞888 on 2020/8/13.
//  Copyright © 2020 讯飞888. All rights reserved.
//
import Foundation

extension Notification.Name {
    static let didLogin = Notification.Name("userDidLogin")
    static let didAddBooks = Notification.Name("didAddBooks")
    static let folowerChanged = Notification.Name("folowerChanged") // 关注我的人 列表数据 有变化 

    static let conversationRestart = Notification.Name("conversationRestart") // 重新开始对话
    
    static let conversationNext = Notification.Name("conversationNext") // 开始下一个对话
    static let conversationResultSubmit = Notification.Name("conversationResultSubmit") // 对话结果 提交
}
