//
//  BaseViewController.swift
//  TuoYouBao
//
//  Created by 郭令 on 2021/11/10.
//

import UIKit
import SnapKit

class BaseViewController: UIViewController {
    
    var titleLab_gl:UILabel!
    var leftBtn_gl:UIButton!
    var bar_gl:NBNavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .backGroundColor
        setupViews()
        
        let bar:NBNavigationBar = NBNavigationBar.add(self.view) { [self] leftBtn, rightBtn, titleLab, bottomLineView, color, leftLineView in
//            leftBtn?.setImage(UIImage.init(named: "ic_commom__back"), for: .normal)
//            let button: UIButton = leftBtn!
//            button.click = {
//                (AnyObject) -> () in
//                self.navigationController?.popViewController(animated: true)
//            }
            leftBtn?.setImage(kImage("back_icon"), for: .normal)
            leftBtn?.addTarget(self, action: #selector(handlePop), for: .touchUpInside)

            titleLab?.text = "根控制器"
            titleLab?.textColor = UIColor.text()
            self.leftBtn_gl = leftBtn
            self.titleLab_gl = titleLab
            
        }
        self.view.addSubview(bar)
        self.bar_gl = bar
        

    }
    
    deinit {
        print("\(self) deinit")
    }
    
    func setupViews() {
        view.backgroundColor = .backGroundColor
        
        if let nav = self.navigationController, nav.viewControllers.count > 1 {
            
//            self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: R.image.ic_commom__back(), style: .done, target: self, action: #selector(handlePop))
            
            self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "ic_commom__back"), style: .done, target: self, action: #selector(handlePop))

        }
        
    }
    
    @objc private func handlePop(){
        pop()
    }
    
    func pop() {
        self.navigationController?.popViewController(animated: true)
    }

}
