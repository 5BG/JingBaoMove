//
//  ContactViewController.swift
//  JingBao
//
//  Created by 5BG on 2016/1/6.
//  Copyright © 2016年 Sunny. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var titleLabel: UILabel!
   
    @IBOutlet weak var contactTV: UITableView!
    var lblTitle = ""
    var tel = ""
    var mail = ""
    var contact = ""
    var website = ""
    var address = ""
    var index = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleLabel.text = lblTitle

        pageControl.currentPage = index
        self.contactTV.delegate = self
        self.contactTV.estimatedRowHeight = 36.0
        self.contactTV.rowHeight = UITableViewAutomaticDimension
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
        let cell = tableView.dequeueReusableCellWithIdentifier("ContactCell", forIndexPath: indexPath) as! ContactTableViewCell
        cell.backgroundColor = UIColor.clearColor()
        // Configure the cell...
        switch indexPath.row{
            
        case 0:
            cell.field.text = "聯絡電話"
            cell.value.text = "(765)456-9023"
        case 1:
            cell.field.text = "電子信箱"
            cell.value.text = "info@dda-tech.net"
        case 2:
            cell.field.text = "主要聯絡人"
            cell.value.text = "Mary Brown"
        case 3:
            cell.field.text = "網站"
            cell.value.text = "www.dda-tech.net"
        case 4:
            cell.field.text = "地址"
            cell.value.text = "2995 Tanglewood Road Moscow, MS 38057"
        default:
            cell.field.text = ""
            cell.value.text = ""
        }
        return cell
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
