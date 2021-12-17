//
//  IFBaseViewModel.swift
//  AIHelmet
//
//  Created by Minsir on 2020/11/4.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources
class IFBaseViewModel : NSObject {
     var disposeBag = DisposeBag()

    
    deinit {
        print("ViewModel :\(self) deinit")
    }
}

protocol IFViewModelType{
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}


