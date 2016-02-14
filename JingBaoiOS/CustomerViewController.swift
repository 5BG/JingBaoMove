//
//  CustomerViewController.swift
//  JingBao
//
//  Created by 5BG on 2015/12/29.
//  Copyright © 2015年 Sunny. All rights reserved.
//

import UIKit

class CustomerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var lblCustomerID: UILabel!
    
    @IBOutlet weak var lblCustomerName: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var customerTV: UITableView!
    
    
    var index = 0
    var lblTitle = ""
    var customerID = ""
    var customerName = ""
    var img = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleLabel.text = lblTitle
        lblCustomerID.text = customerID;
        lblCustomerName.text = customerName;
        
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
        pageControl.currentPage = index
        self.customerTV.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CustomerCell", forIndexPath: indexPath) as! CustomerTableViewCell
        cell.backgroundColor = UIColor.clearColor()
        // Configure the cell...
        switch indexPath.row{
            
        case 0:
            cell.field.text = "Credit"
            cell.value.text = "50000.00$"
        case 1:
            cell.field.text = "Sales Employee"
            cell.value.text = "Bill Levine"
        case 2:
            cell.field.text = "Contact"
            cell.value.text = "Mary Brown"
        case 3:
            cell.field.text = "Payment"
            cell.value.text = "2P10Net30"
        case 4:
            cell.field.text = "SalesList"
            cell.value.text = "A001"
        default:
            cell.field.text = ""
            cell.value.text = ""
        }
        return cell
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
