//
//  FirstBoard.swift
//  TYB
//
//  Created by qsx on 2021/12/7.
//

import UIKit

class FirstBoard: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btn = UIButton.init()
        view.addSubview(btn)
        btn.snp.makeConstraints { (make) in
            make.center.equalTo(view)
            make.height.width.equalTo(100)
        }
        btn.backgroundColor = .red
        _ = btn.rx.tap.subscribe(onNext:  { [weak self] in
            
            self?.reloadData()
        })
        
        
    }
    
    func reloadData() {
        
        let path = Bundle.main.path(forResource: "HomeP", ofType: "geojson")
        let data = try? Data(contentsOf: URL(fileURLWithPath: path!))
        //        let array = [CLHomePageModel].map(JSONData: data)
        print(data as Any)
        let arr =  self.dataToJson(data: data! as NSData)
        print("====\(arr)")
        
    }
    /* 转Json  */
    func dataToJson(data:NSData) ->AnyObject? {
        do {
            return try JSONSerialization.jsonObject(with: data as Data, options: .mutableContainers) as AnyObject
        } catch  {
            print(error)
        }
        return nil
    }
}
