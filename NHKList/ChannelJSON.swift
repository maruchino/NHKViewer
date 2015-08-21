//
//  ChannelJSON.swift
//  NHKList
//
//  Created by  intern on 2015/08/21.
//  Copyright (c) 2015年 sonicmoov. All rights reserved.
//

import UIKit

import Mantle

public class ListsJSON: MTLModel, MTLJSONSerializing  {
    
    public var lists = [ListJSON]()
    public class func JSONKeyPathsByPropertyKey() -> [NSObject : AnyObject]!{
        return[
            "lists":"list.g1"
        ]
    }
    
    public class func listsJSONTransformer() -> NSValueTransformer {
        return MTLJSONAdapter.arrayTransformerWithModelClass(ListJSON.self)
    }
}

public class ListJSON: MTLModel, MTLJSONSerializing  {
    
    //public var even_id: String?
    public var title: String?
    public var subtitle: String?
    public var startTime: String?
    public var endTime: String?
    
    
    public class func JSONKeyPathsByPropertyKey() -> [NSObject : AnyObject]! {
        return[
            "title":"title",
            "subtitle":"subtitle",
            "startTime":"start_time",
            "endTime":"end_time",
                    ]
    }
           public class func listURLJSONTransformer() -> NSValueTransformer{
        return NSValueTransformer(forName: MTLURLValueTransformerName)!
        }
}
