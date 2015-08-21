//
//  ChannelViewController.swift
//  
//
//  Created by  intern on 2015/08/20.
//
//

import UIKit

import Result

class channelsViewController: UITableViewController{
    
    private var items = [ChannelJSON]()
    private var manager = SearchManager()
    
    override func viewDidLoad(){
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func onDataChanged(result: Result<ChannelsJSON,NSError>){
        if let value = result.value {
            channels = value.items
            tableView.reloadData()
        }
        refreshControl?.endRefreshing()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        switch segue.destinationViewController{
        case let viewController as BrowserViewController:
            if let itemCell = sender as? ItemCell {
                viewController.URL = channelCell.channel?.itemURL
            }
        default:()
        }
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        manager.searchItems(searchBar.text, handler: onDataChanged)
    }
}

extension ChannelsViewController:UITableViewDataSource{
    
    override func tableView(tableView: UITableView,numberOfRowsInSection section: Int) ->
        Int{
            return items.count
    }
    
    override func tableView (tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("ItemCell",forIndexPath:indexPath) as! ItemCell
        cell.item = items[indexPath.row]
        return cell
    }
}


