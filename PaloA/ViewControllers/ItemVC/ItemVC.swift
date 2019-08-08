//
//  ItemVC.swift
//  PaloA
//
//  Created by Amir Avisar on 08/08/2019.
//  Copyright © 2019 Amir Avisar. All rights reserved.
//

import UIKit

class ItemVC: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var originalNameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var voteAvgLabel: UILabel!
    @IBOutlet weak var originalLanLabel: UILabel!
    @IBOutlet weak var adultLabel: UILabel!
    @IBOutlet weak var overViewTV: UITextView!
    
    //MARK: Members
    var item : Item?
    
     //MARK: Override
    override func viewDidLoad() {
        super.viewDidLoad()
        initLabels()
    }
    
     //MARK: Private Methids
    private func initLabels(){
        if item is Movie {
            let movieItem : Movie = item as! Movie
                nameLabel.text = movieItem.title
                originalNameLabel.text = movieItem.originalTitle
                statusLabel.text = handleDate(dateString : movieItem.releaseDate)
                voteAvgLabel.text = movieItem.voteAvarage.description
                originalLanLabel.text = movieItem.originalLanguage
                adultLabel.text = movieItem.adult.description
                overViewTV.text = movieItem.overView
        } else {
            let tvSeriesItem : TVSeries = item as! TVSeries
                nameLabel.text = tvSeriesItem.name
                originalNameLabel.text = tvSeriesItem.originalName
                statusLabel.text = handleDate(dateString : tvSeriesItem.firstAirDate)
                voteAvgLabel.text = tvSeriesItem.voteAvarage.description
                originalLanLabel.text = tvSeriesItem.originalLanguage
                adultLabel.text = false.description
                overViewTV.text = tvSeriesItem.overView
        }
    }
    
    //MARK: Actions
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func handleDate(dateString : String) -> String {
        if DatesManager.isDateInPast(stringDate: dateString) {
            return "Release"
        } else {
            return "Comming soon"
        }
    }
}
