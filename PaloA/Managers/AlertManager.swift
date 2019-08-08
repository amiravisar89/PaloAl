//
//  AlertManager.swift
//
//
//  Created by Amir Avisar on 07/08/2019.
//  Copyright © 2019 Amir Avisar. All rights reserved.
//

import UIKit

class AlertManager: NSObject {
    
    //pop alert with subtitle string
    static func makeAlertWithString(_ str : String , controller : UIViewController){
        let alert = UIAlertController(title: "", message: str, preferredStyle: UIAlertController.Style.alert)
        controller.present(alert, animated: true, completion: nil)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
            switch action.style{
            case .default:
                print("default")
            case .cancel:
                print("cancel")
            case .destructive:
                print("destructive")
            @unknown default:
                return
            }
        }))
    }
    
}
