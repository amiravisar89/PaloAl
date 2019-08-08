//
//  VCModel.swift
//  PaloA
//
//  Created by Amir Avisar on 07/08/2019.
//  Copyright © 2019 Amir Avisar. All rights reserved.
//

import UIKit

class VCModel : NSObject{
    
    //MARK: - Members
    var apiRequest : APIRequest?
    var currentPage = 0                  // for Paging
    var type : PAType?
    var response : BaseResponse?         // Can be TvResponse or MovieResponse on runtime
    var itemsArry : [Item] = [Item]()
    
    //MARK: - Init
    
    /*
      Init model by type.
      All view controllers using this func to init the url and type depending on their api
     - Parameters:
        - type: PAtype to distinguish between models
    */
    init(type : PAType){
        switch type {
        case .nowPlaying:
            apiRequest = APIRequest(endPint: "/3/movie/now_playing?api_key=" + APIRequest.APIKEY + "&language=en-US&page=")
            self.type = .nowPlaying
        case .popularMovies:
            apiRequest = APIRequest(endPint: "/3/movie/popular?api_key=" + APIRequest.APIKEY + "&language=en-US&page=")
            self.type = .popularMovies
        case .popularTV:
            apiRequest = APIRequest(endPint: "/3/tv/popular?api_key=" + APIRequest.APIKEY + "&language=en-US&page=")
            self.type = .popularTV
        }
        apiRequest?.setUrlWith(page: currentPage)
    }
    
    //MARK: - Internal funcs
    
    /*
     get Items asynchronicly and parse by polymorphism
     - Parameters:
        - completionHandler to use when func is done
    */
    func getItems (completionHandler: @escaping (_ success : Bool) -> Void) {
        currentPage += 1
        apiRequest?.setUrlWith(page: currentPage)
        apiRequest?.sendRequest(completionHandler: { [weak self] (response, error) in
            DispatchQueue.main.async {  // return to main Thread
                guard (error == nil) else {
                    completionHandler(false)
                    return
                }
            }
            do{
                let respond :MovieResponse  = try JSONDecoder().decode( MovieResponse.self, from: response!)
                DispatchQueue.main.async {  // return to main Thread
                    self?.currentPage = respond.page
                    self?.response = respond
                    self?.itemsArry.append(contentsOf: respond.items)
                    completionHandler(true)
                }
            } catch _ {
                do {
                    let respond = try JSONDecoder().decode( TVResponse.self, from: response!)
                    DispatchQueue.main.async {  // return to main Thread
                        self?.currentPage = respond.page
                        self?.response = respond
                        self?.itemsArry.append(contentsOf: respond.items)
                        completionHandler(true)
                    }
                } catch _ {
                    DispatchQueue.main.async {  // return to main Thread
                        completionHandler(false)
                    }
                }
            }
            
        })
    }
}


