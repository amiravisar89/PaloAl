//
//  Movie.swift
//  PaloA
//
//  Created by Amir Avisar on 07/08/2019.
//  Copyright © 2019 Amir Avisar. All rights reserved.
//

import UIKit

class BaseResponse : Decodable {
    var page : Int
    var totalResults : Int
    var totalPages : Int
    
    private enum CodingKeys: String, CodingKey {
        case page = "page"
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}

class MovieResponse : BaseResponse {
    var items : [Movie]
    private enum CodingKeys: String, CodingKey {
        case items = "results"
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.items = try container.decode([Movie].self, forKey: .items)
        try super.init(from: decoder)
    }
}

class TVResponse : BaseResponse {
    var items : [TVSeries]
    private enum CodingKeys: String, CodingKey {
        case items = "results"
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.items = try container.decode([TVSeries].self, forKey: .items)
        try super.init(from: decoder)
    }
}







