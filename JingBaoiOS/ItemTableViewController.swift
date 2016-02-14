//
//  ItemTableViewController.swift
//  JingBao
//
//  Created by 5BG on 2015/11/17.
//  Copyright © 2015年 Sunny. All rights reserved.
//

import UIKit

class ItemTableViewController: UITableViewController, UISearchBarDelegate{
    
    @IBOutlet var itemSearchBar: UISearchBar!
    
    var itemModel = ItemTableViewModel()
    var itemList = [Item]()
    //var approvalDetailList: [ApprovalDetailInfo]?
    var selectedItem = Item()
    
    var searchResults = [Item]()
    var searchActive : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "loadingTableView", name: "dataLoadingNotificationKey", object: nil)
        itemSearchBar.delegate = self
        
        self.tableView.contentOffset = CGPointMake(0, CGRectGetHeight(itemSearchBar.frame))
        definesPresentationContext = true
        itemModel.qryItemCollections()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if(searchActive) {
            return searchResults.count
        }
     
        return self.itemList.count
     
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        let cell = self.tableView.dequeueReusableCellWithIdentifier("ItemCell", forIndexPath: indexPath) as! ItemTableViewCell
        
        var item = Item()
        
        if searchActive && searchResults.count != 0 {
            item = searchResults[indexPath.row]
        } else {
            item = itemList[indexPath.row]
        }
        
        let base64String = item.getItemImg()
        if !base64String.isEmpty{
            let decodedData = NSData(base64EncodedString: base64String, options: NSDataBase64DecodingOptions(rawValue: 0))
            if decodedData != nil{
                let decodedimage = UIImage(data: decodedData!)
                cell.itemImg.image = decodedimage
                
                cell.itemImg.layer.cornerRadius = cell.itemImg.frame.size.width / 2
                cell.itemImg.clipsToBounds = true
            }
        }
        
        // Configure the cell...
        cell.itemID.text = item.getItemID()
        cell.itemName.text = item.getItemName()
        cell.itemSpec.text = item.getItemSpec()
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("showItemDetail", sender: self)
    }
    
    func filterContentForSearchText(searchText: String)
    {
        // 過濾目前陣列
        searchResults = itemList.filter({
            (item: Item) -> Bool in
                let nameMatch = item.itemID?.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
            return nameMatch != nil
        })
    }
   
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 106
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showItemDetail"{
            let searchStr = itemSearchBar.text
            //print(searchStr.isEmpty!)
            if !(searchStr?.isEmpty)!{
                if let indexPath = self.searchDisplayController?.searchResultsTableView.indexPathForSelectedRow
                {
                    let destinationController = segue.destinationViewController as! ItemDetailTableViewController
                    destinationController.item = searchResults[indexPath.row]
                }
            }else{
                if let indexPath = self.tableView.indexPathForSelectedRow{
                    let destinationController = segue.destinationViewController as! ItemDetailTableViewController
                    destinationController.item = itemList[indexPath.row]
                }
            }
        }
    }
    
    
    func loadingTableView()
    {
        itemList = itemModel.itemList!
    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        searchActive = true
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        searchActive = false
        
        if searchBar.text!.isEmpty{
            searchResults.removeAll()
            self.tableView.reloadData()
        }
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchActive = false;
        searchResults.removeAll()
        self.tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        searchResults.removeAll()
        if !searchText.isEmpty
        {
            filterContentForSearchText(searchText)
            if(searchResults.count == 0){
                self.tableView.separatorColor = UIColor.clearColor()
            } else {
                searchActive = true;
            }
        }
       
        self.tableView.reloadData()
    }
}
