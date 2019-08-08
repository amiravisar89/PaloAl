//
//  MyUIView.swift
//  PetNet
//
//  Created by Amir Avisar on 24/06/2018.
//  Copyright © 2018 Amir Avisar. All rights reserved.
//

import UIKit


extension UIView {
    
    @IBInspectable var borderWidth : CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor {
        set{
            layer.borderColor = newValue.cgColor
        }get
        {
            return UIColor(cgColor: layer.borderColor!)
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set
        {
            layer.cornerRadius = newValue
            layer.masksToBounds = true
        }
        get
        {
            return self.layer.cornerRadius
        }
    }

    @IBInspectable var isCircullar: Bool  {
        
        set {
            if (newValue){
                layer.masksToBounds = true
                self.cornerRadius = frame.width / 2
            }
        }
        get {
            return self.isCircullar
        }
    }
    
    func setCircular(){
        self.layer.masksToBounds = true
        self.layer.cornerRadius = frame.size.width / 2
    }
   
    
}
