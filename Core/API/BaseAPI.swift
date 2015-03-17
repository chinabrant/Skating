//
//  BaseAPI.swift
//  Tianmijie
//
//  Created by Brant on 12/26/14.
//  Copyright (c) 2014 tianmitech. All rights reserved.
//

import Foundation

enum RequestState {
    case None
    case Requesting
}

protocol BaseAPIDelegate {
    func didFinishRequest(data: NSDictionary, errorCode: Int, errorDesc: String, requestType: RequestState)
    func didFailRequest(data: NSDictionary, message: String, errorCode: Int)
    func didFailWithNetworkError(error: NSError)
}

public class BaseAPI {

    var pageSize: Int = 10
    var query: AVQuery?
    var delegate: BaseAPIDelegate?
    var requestState: RequestState = RequestState.None
    
    init() {
        
    }
    
}