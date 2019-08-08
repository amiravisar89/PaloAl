//
//  BaseRequest.swift
//  PaloA
//
//  Created by Amir Avisar on 07/08/2019.
//  Copyright © 2019 Amir Avisar. All rights reserved.
//

import UIKit

class APIRequest: NSObject {
    
    //MARK: - Members
    static let APIKEY = "7dbc92cbbe611e330bf5d2ca62943684"
    let baseUrl = "https://api.themoviedb.org"
    var endPoint = ""
    var url = ""
    
    init(endPint : String){
        self.endPoint = endPint
    }
    
    //MARK: - Internal funcs
    func setUrlWith(page : Int){
        self.url = baseUrl + endPoint + String(page)
    }
    
    func sendRequest(completionHandler: @escaping (_ result : Data?, _ error : Error?) -> Void) {
        guard let url = URL(string: url) else {
            let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "Url missing"])
            completionHandler(nil, error)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard (data != nil) else { return }
            guard (error == nil) else {
                completionHandler(nil, error)
                return
            }
            completionHandler(data, nil)
        }
        task.resume()
    }
}

enum PAType : String {
    case nowPlaying
    case popularMovies
    case popularTV
}
