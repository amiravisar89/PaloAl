//
//  Items.swift
//  PaloA
//
//  Created by amir avisar on 07/08/2019.
//  Copyright © 2019 Amir Avisar. All rights reserved.
//

import UIKit

class Item: Decodable {
    var voteCounts : Int
    var id: Int
    var voteAvarage : CGFloat
    var popularity : CGFloat
    var originalLanguage : String
    var overView : String
    
    private enum CodingKeys: String, CodingKey {
        case voteCounts = "vote_count"
        case id = "id"
        case voteAvarage = "vote_average"
        case popularity = "popularity"
        case originalLanguage = "original_language"
        case overView = "overview"
    }
}

class TVSeries : Item {
    var originalName : String
    var name : String
    var firstAirDate : String
    
    private enum CodingKeys: String, CodingKey {
        case firstAirDate = "first_air_date"
        case originalName = "original_name"
        case name = "name"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.firstAirDate = try container.decode(String.self, forKey: .firstAirDate)
        self.originalName = try container.decode(String.self, forKey: .originalName)
        self.name = try container.decode(String.self, forKey: .name)
        try super.init(from: decoder)
    }
    
}

class Movie : Item {
    var adult : Bool
    var originalTitle : String
    var title : String
    var releaseDate : String
    
    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case originalTitle = "original_title"
        case title = "title"
        case releaseDate = "release_date"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.adult = try container.decode(Bool.self, forKey: .adult)
        self.originalTitle = try container.decode(String.self, forKey: .originalTitle)
        self.title = try container.decode(String.self, forKey: .title)
        self.releaseDate = try container.decode(String.self, forKey: .releaseDate)
        try super.init(from: decoder)
    }
}

