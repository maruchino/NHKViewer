//
//  ViewController.swift
//  NHKList
//
//  Created by  intern on 2015/08/20.
//  Copyright (c) 2015年 sonicmoov. All rights reserved.
//

import UIKit

import Result

class ChannelsViewController: UITableViewController{
    
    private var lists = [ListJSON]()
    private var manager = SearchManager()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        refresh()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func onDataChanged(result: Result<ListsJSON,NSError>){
        if let value = result.value {
            lists = value.lists
            tableView.reloadData()
        }
        refreshControl?.endRefreshing()
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
//        switch segue.destinationViewController{
//        case let viewController as BrowserViewController:
//            if let listCell = sender as? ChannelCell {
//                viewController.URL = listCell.list?.listslURL
//            }
//        default:()
//        }
//    }
    
    @IBAction func refresh() {
        manager.searchLists(onDataChanged)
    }

}

extension ChannelsViewController:UITableViewDataSource{
    
    override func tableView(tableView: UITableView,numberOfRowsInSection section: Int) ->
        Int{
            return lists.count
    }
    
    override func tableView (tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("ChannelCell",forIndexPath:indexPath) as! ChannelCell
        cell.list = lists[indexPath.row]
        return cell
    }
}


