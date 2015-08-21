//
//  ItemJSON.swift
//  
//
//  Created by  intern on 2015/08/20.
//
//

import UIKit

import Mantle

public class ChannelsJSON: MTLModel, MTLJSONSerializing  {
    
    public var channels = [ItemJSON]()
    public class func JSONKeyPathsByPropertyKey() -> [NSObject : AnyObject]!{
        return[
            "channels":"Channels"
        ]
    }
    
    public class func channelsJSONTransformer() -> NSValueTransformer {
        return MTLJSONAdapter.arrayTransformerWithModelClass(ChannelJSON.self)
    }
}

public class ChannelJSON: MTLModel, MTLJSONSerializing  {
    
    public var title: String?
    public var author: String?
    public var itemURL: NSURL?
    public var content: String?
    public var largeImage: String?
    public var channelPrice = 0
    
    public class func JSONKeyPathsByPropertyKey() -> [NSObject : AnyObject]! {
        return[
            "title":"Channel.title",
            "author":"Channel.author",
            "itemURL":"Channel.channelUrl",
            "content":"Channel.channelCaption",
            "largeImage":"Channel.largeImageUrl",
            "itemPrice":"Channel.channelPrice",
        ]
    }
    public class func channelURLJSONTransformer() -> NSValueTransformer{
        return NSValueTransformer(forName: MTLURLValueTransformerName)!
    }
}
