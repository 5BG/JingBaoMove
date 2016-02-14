//
//  CustomerPickTableViewController.swift
//  JingBao
//
//  Created by 5BG on 2016/1/13.
//  Copyright © 2016年 Sunny. All rights reserved.
//

import UIKit

// protocol used for sending data back
protocol CustomerPickTableViewControllerDelegate{
    // protocol definition goes here
    func setCustomerPick(customerPick: Customer)
}


class CustomerPickTableViewController: UITableViewController, UISearchResultsUpdating, UISearchBarDelegate{

    var customerList = [Customer]()
    var selectedRow = Customer()
    var customerModel = CustomerModel()
    var searchResults = [Customer]()
    var searchActive : Bool = false
    var searchController: UISearchController!
    var customerPickID : String?
    var mDelegate: CustomerPickTableViewControllerDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "loadingTableView", name: "dataLoadingPickNotificationKey", object: nil)
      
        // Setup the Search Controller
        configureSearchController()
        customerModel.qryCustomerCollections()
        let navigationBar = navigationController!.navigationBar
        navigationBar.barTintColor = UIColor(red: CGFloat(124/255.0),green: CGFloat(179/255.0),blue: CGFloat(239/255.0),alpha: CGFloat(1.0))
        navigationBar
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
        return customerList.count
    }
    
    func loadingTableView(){
        
        customerList = customerModel.customerDataList!
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("CustomerCell", forIndexPath: indexPath) as! CustomerPickTableViewCell
        
        var customer = customerList[indexPath.row]

        if searchActive && searchResults.count != 0 {
            customer = searchResults[indexPath.row]
        } else {
            customer = customerList[indexPath.row]
        }
//
//        let base64String = item.getItemImg()
//        if !base64String.isEmpty{
//            let decodedData = NSData(base64EncodedString: base64String, options: NSDataBase64DecodingOptions(rawValue: 0))
//            if decodedData != nil{
//                let decodedimage = UIImage(data: decodedData!)
//                cell.itemImg.image = decodedimage
//                
//                cell.itemImg.layer.cornerRadius = cell.itemImg.frame.size.width / 2
//                cell.itemImg.clipsToBounds = true
//            }
//        }
        
        // Configure the cell...
        cell.lblCustomerID.text = customer.getCustomerID()
        cell.lblCustomerName.text = customer.getCustomerName()
        
        // keep selected checkmark on search result
        if(selectedRow.customerID != nil)
        {
            if(cell.lblCustomerID.text! == selectedRow.customerID!)
            {
                cell.accessoryType = UITableViewCellAccessoryType.Checkmark
            }else{
                cell.accessoryType=UITableViewCellAccessoryType.None
            }
        }
       

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var customerArray = tableView.visibleCells;
        
        for(var i = 0 ; i < customerArray.count ; i++){
            
            let cells:UITableViewCell = customerArray[i] as! CustomerPickTableViewCell;
            
            cells.accessoryType=UITableViewCellAccessoryType.None
            
        }
        
        let cell: UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        if cell.accessoryType == UITableViewCellAccessoryType.None {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
            if (searchActive){
                selectedRow = searchResults[indexPath.row]}
            else{
                 selectedRow = customerList[indexPath.row]
            }
          
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.None
        }
      
    }
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
        let cell: UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        if cell.accessoryType == UITableViewCellAccessoryType.None {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.None
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }
    
    
    func configureSearchController() {
        // Initialize and perform a minimum configuration to the search controller.
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.delegate = self
        // Make sure the that the search bar is visible within the navigation bar.
        searchController.searchBar.sizeToFit()
        
        // Include the search controller's search bar within the table's header view.
        tableView.tableHeaderView = searchController.searchBar
        
        definesPresentationContext = true
    }

    
    // MARK: - Search Controller
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        let searchText = searchController.searchBar.text
        
        filterContentForSearchText(searchText!)
        self.tableView.reloadData()
    }
    
    func filterContentForSearchText(searchText: String) {
        searchResults = customerList.filter({ ( customer: Customer) -> Bool in
            
            let nameMatch = customer.customerID!.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
           
            return nameMatch != nil //|| locationMatch != nil
            
        })
        
    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        searchActive = true
        print("searchBarTextDidBeginEditing")
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
            //filterContentForSearchText(searchText)
            if(searchResults.count == 0){
                //self.tableView.separatorColor = UIColor.clearColor()
            } else {
                searchActive = true;
            }
            
        }
        //self.tableView.reloadData()
    }
    
    @IBAction func btnCancel(sender: UIBarButtonItem) {
       self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func btnDone(sender: UIBarButtonItem) {
       
        if let pickedID = selectedRow.customerID{
            
            if mDelegate != nil
            {
               mDelegate!.setCustomerPick(selectedRow)
            }
            
        }
        // go back to the previous view controller
        //self.navigationController?.popViewControllerAnimated(true)
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 78
    }
}
