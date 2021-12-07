//
//  ImagePicker.swift
//  TYB
//
//  Created by qsx on 2021/11/26.
//

import UIKit

class ImagePicker: NSObject {
    
    var superVC:UIViewController!
    
    func showPromptBox(superVC:UIViewController) {
        //        1.判断相机是否可用，如果可用就有拍照选项，反正则没有。
        
        self.superVC = superVC
        
        let sexActionSheet = UIAlertController.init(title: nil, message: nil, preferredStyle: .actionSheet)
        
//        weak var weakSelf = self
        
        let sexNanAction = UIAlertAction(title: "从相册中选择", style: .default){ (action:UIAlertAction)in
            self.initPhotoPicker()
            //填写需要的响应方法
        }
        let sexNvAction = UIAlertAction(title: "拍照", style: .default){ (action:UIAlertAction)in
            self.initCameraPicker()
            //填写需要的响应方法
        }
        let sexSaceAction = UIAlertAction(title: "取消", style: .cancel){ (action:UIAlertAction)in
            //填写需要的响应方法
        }
        sexActionSheet.addAction(sexNanAction)
        sexActionSheet.addAction(sexNvAction)
        sexActionSheet.addAction(sexSaceAction)
        UIViewController.current().present(sexActionSheet, animated: true, completion: nil)
    }
    
    
    //MARK: - 相机
    
    //从相册中选择
    func initPhotoPicker(){
        print("------拍照--------")
        let photoPicker =  UIImagePickerController()
        photoPicker.delegate = self
        photoPicker.allowsEditing = false
        photoPicker.sourceType = .photoLibrary
        UIViewController.current().present(photoPicker, animated: true, completion: nil)
    }
    
    //拍照
    func initCameraPicker(){
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let  cameraPicker = UIImagePickerController()
            cameraPicker.delegate = self
            cameraPicker.allowsEditing = true
            cameraPicker.sourceType = .camera
            UIViewController.current().present(cameraPicker, animated: true) {
                
            }
            
            //在需要的地方present出来
//            superVC.present(cameraPicker, animated: true, completion: nil)
            UIApplication.shared.keyWindow?.rootViewController?.present(cameraPicker, animated: true, completion: nil)
        } else {
            print("不支持拍照")
        }
    }
}


extension ImagePicker:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image : UIImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
//        addPicture(image: image)
//         picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        self.viewController()?.dismiss(animated: true, completion: {
//
//        })
    }
    
    
}
