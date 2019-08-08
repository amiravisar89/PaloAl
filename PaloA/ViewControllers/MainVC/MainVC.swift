//
//  PopularMoviesVc.swift
//  PaloA
//
//  Created by amir avisar on 07/08/2019.
//  Copyright © 2019 Amir Avisar. All rights reserved.
//

import UIKit

class MainVC: UIViewController ,UITableViewDelegate , UITableViewDataSource {
    
    //MARK: - OutLets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK - Members
    var maxCell = 20
    var model : VCModel?
    
    //MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        initModel()
    }
    
    //MARK: Private Methods
    private func initModel(){
        guard let resId = self.restorationIdentifier else {
            print("restorationIdentifier is nil")
            return
        }
        guard let type = PAType(rawValue: resId) else {
            print("enumeration faild")
            return
        }
        model = VCModel(type: type)
        startActivity()
        model?.getItems(completionHandler: { (success) in
            self.stopActivity()
            success ? self.initTable() : nil
        })
    }
    
    private func startActivity(){
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
        tableView.isHidden = true
    }
    private func stopActivity(){
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
        tableView.isHidden = false
    }
    
    private func initTable(){
        tableView.registerToCellWith(identifier: "ItemCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    //MARK: - TableViewDelegate
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell") as! ItemCell
        let item =  model?.itemsArry[indexPath.row]
        cell.initCell(item: item!)
        if (indexPath.row >= maxCell - 2){ // TableView reach the maxCell - 2 item and making an api call to bring the next items
            model?.getItems(completionHandler: { (success) in
                self.maxCell = (self.model?.itemsArry.count)!
                if success{
                    self.tableView.reloadData()
                }
            })
        }
        return cell
    }
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = model?.itemsArry.count else { return 0 }
        return count
    }
    
    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let itemVC = (storyBoard.instantiateViewController(withIdentifier: "ItemVC") as! ItemVC)
        itemVC.item = model?.itemsArry[indexPath.row]
        self.navigationController?.pushViewController(itemVC, animated: true)
    }
    
    internal func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}


