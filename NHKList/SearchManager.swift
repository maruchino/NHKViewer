//
//  SearchManager.swift
//  NHKList
//
//  Created by  intern on 2015/08/21.
//  Copyright (c) 2015年 sonicmoov. All rights reserved.
//

import UIKit

import Result

public class SearchManager: NSObject{
    
    
    lazy var client: APIClient = APIClient()
    
    public func searchLists(handler: Result<ListsJSON, NSError> -> ()){
        client.request(SearchEndpoint(), handler: handler)
    }
}

