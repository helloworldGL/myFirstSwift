//
//  LoginBoard.swift
//  TuoYouBao
//
//  Created by 郭令 on 2021/11/9.
//

import UIKit
import SnapKit

class LoginBoard: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        
        self.view.backgroundColor = UIColor.white
        //登录页面背景图片
        self.creatHead()
        self.body()
    }
    
    //登录页面背景图片
    func creatHead(){
        self.view.addSubview(headImageV)
        headImageV.snp.makeConstraints { make in
            make.top.bottom.right.left.equalToSuperview()
        }
    }
    
    func body() {
        self.view.addSubview(loginBtn)
        loginBtn.snp.makeConstraints { make in
            make.right.equalTo(self.view.snp_centerXWithinMargins).offset(-40)
            make.top.equalTo(320)
        }
        self.loginBtn.isSelected = true
        
        self.view.addSubview(resignBtn)
        resignBtn.snp.makeConstraints { make in
            make.left.equalTo(self.view.snp.centerX).offset(40)
            make.top.equalTo(320)
        }
        //按钮下方小三角
        self.view.addSubview(tipsdImageView)
        tipsdImageView.snp.makeConstraints { make in
            make.top.equalTo(loginBtn.snp.bottom).offset(5)
            make.centerX.equalTo(loginBtn)
        }
        
//        登录框
        let loginView:UIView = UIView.init()
        self.view.addSubview(loginView)
        loginView.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.top.equalTo(loginBtn.snp.bottom).offset(30)
            make.left.equalTo(40)
            make.right.equalTo(-40)
            make.height.equalTo(100)
        }
        
        loginView.layer.cornerRadius = 8
        loginView.layer.borderColor = UIColor.black.cgColor
        loginView.layer.borderColor = RGBAArrayColor(rgbaArray: [153,153,153]).cgColor
        loginView.layer.masksToBounds = true
        loginView.layer.borderWidth = 1;
        
        //添加分割线
        let lineV = UIView.init()
        lineV.backgroundColor = RGBAArrayColor(rgbaArray: [153,153,153])
        loginView.addSubview(lineV)
        lineV.snp.makeConstraints { make in
            make.centerY.equalTo(loginView)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(1)
        }
        //添加账户输入框
        loginView.addSubview(loginTF)
        loginTF.snp.makeConstraints { make in
            make.top.equalTo(0)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(50)
        }
        
        //添加密码输入框
        loginView.addSubview(passwordTF)
        passwordTF.snp.makeConstraints { make in
            make.top.equalTo(50)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(50)
        }
        
        //增加登录的按钮
        let loginButton = UIButton.init()
        self.view.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.top.equalTo(loginView.snp.bottom).offset(30)
        }
        loginButton.setImage(UIImage.init(named: "go"), for: .normal)
        loginButton.setImage(UIImage.init(named: "go"), for: .highlighted)
        loginButton.addTarget(self, action: #selector(goMain), for: .touchUpInside)
        

        
    }

    
    
    
    
    
    
    // MARK: - <<<<<<<<<<<<<<<< Life Cycle >>>>>>>>>>>>>>>> -
    
    // MARK: - <<<<<<<<<<<<<<<< Nofifaction Action >>>>>>>>>>>>>>>> -
    
    // MARK: - <<<<<<<<<<<<<<<< Event >>>>>>>>>>>>>>>> -
    
    // MARK: - <<<<<<<<<<<<<<<< IBoutlet >>>>>>>>>>>>>>>> -
    
    //登录按钮
    @objc private func goLogin() {
        

        if !loginBtn.isSelected {
            tipsdImageView.snp.remakeConstraints { make in
                make.centerX.equalTo(self.loginBtn)
                make.top.equalTo(loginBtn.snp.bottom).offset(5)
            }
        }
        
        loginBtn.isSelected = true
        resignBtn.isSelected = false
        headImageV.image = UIImage.init(named: "bg2")
    }
    @objc private func goResign(){
        
        if !resignBtn.isSelected {
            tipsdImageView.snp.remakeConstraints { make in
                make.centerX.equalTo(self.resignBtn)
                make.top.equalTo(loginBtn.snp.bottom).offset(5)
            }
        }
        resignBtn.isSelected = true
        loginBtn.isSelected = false
        headImageV.image = UIImage.init(named: "bg3")
    }
    
    
    @objc private func goMain() {
        
        //这里切换根控制器
        UIApplication.shared.keyWindow?.rootViewController = YTabBarBoard.init()
        
    }
    
    // MARK: - <<<<<<<<<<<<<<<< Delegate >>>>>>>>>>>>>>>> -
    
    // MARK: - <<<<<<<<<<<<<<<< Get/Set >>>>>>>>>>>>>>>> -
    
    
    
// MARK: - <<<<<<<<<<<<<<<< Lazy >>>>>>>>>>>>>>>> -
    
    //登录页面背景图
    lazy var headImageV: UIImageView = {
        
        let imageV = UIImageView.init(image: UIImage.init(named: "bg2"))
        return imageV
    }()
    
    //登录按钮
    lazy var loginBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage.init(named: "btn_dl_preesd"), for: .normal)
        button.setImage(UIImage.init(named: "btn-dl"), for: .selected)
        button.addTarget(self, action: #selector(goLogin), for: UIControl.Event.touchUpInside)
        return button
    }()
    
    //注册按钮
    lazy var resignBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage.init(named: "btn_zc_press"), for: .normal)
        button.setImage(UIImage.init(named: "btn-zc"), for: .selected)
        button.addTarget(self, action: #selector(goResign), for: UIControl.Event.touchUpInside)
        return button
    }()
    
    lazy var tipsdImageView: UIImageView = {
        let nodat:UIImage = UIImage(named: "icon_sj")!
        let nodatImageV = UIImageView.init(image: nodat)
        return nodatImageV
    }()
    
    lazy var loginTF: UITextField = {
        let textFiled = UITextField.init()
        textFiled.placeholder = "请输入手机号码"
//        textFiled.keyboardType = UIKeyboardTypeNumberPad
        textFiled.keyboardType = UIKeyboardType.numberPad
        textFiled.font = UIFont.systemFont(ofSize: 16)
        return textFiled

    }()
    
    lazy var passwordTF: UITextField = {
        let textFiled = UITextField.init()
        textFiled.placeholder = "请输入密码"
//        textFiled.keyboardType = UIKeyboardTypeNumberPad
        textFiled.keyboardType = UIKeyboardType.asciiCapable
        textFiled.font = UIFont.systemFont(ofSize: 16)
        return textFiled

    }()
    
}
