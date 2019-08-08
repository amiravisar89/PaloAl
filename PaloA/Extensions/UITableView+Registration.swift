//
//  MyTableView.swift
//  FWD
//
//  Created by Amir Avisar on 02/07/2018.
//  Copyright © 2018 Amir Avisar. All rights reserved.
//

import UIKit

extension UITableView {
    func registerToCellWith(identifier : String){
        self.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
    }
}
