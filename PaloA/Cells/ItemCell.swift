//
//  MovieCell.swift
//  PaloA
//
//  Created by Amir Avisar on 07/08/2019.
//  Copyright © 2019 Amir Avisar. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    //MARK - Outlets
    @IBOutlet weak var ItemNameLabel: UILabel!
    @IBOutlet weak var firstAirDateLabel: UILabel!
    @IBOutlet weak var itemRankLabel: UILabel!
    
    //MARK - Members
    var item : Item?
    
    /*
     initCell.
     Init cell ui depending on the item type
     - Parameters:
        - item: item can be Movie or TvSeries by polymorphism
     */
    func initCell(item : Item){
        self.item = item
        itemRankLabel.text = self.item?.voteAvarage.description
        if item is Movie {
            let movieItem = item as! Movie
            ItemNameLabel.text = movieItem.title
            firstAirDateLabel.text = movieItem.releaseDate
        } else {
            let tvSeriesItem = item as! TVSeries
            ItemNameLabel.text = tvSeriesItem.name
            firstAirDateLabel.text = tvSeriesItem.firstAirDate
        }
    }
}
