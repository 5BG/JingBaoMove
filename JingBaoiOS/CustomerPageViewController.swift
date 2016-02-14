//
//  CustomerPageViewController.swift
//  JingBao
//
//  Created by 5BG on 2015/12/29.
//  Copyright © 2015年 Sunny. All rights reserved.
//

import UIKit

class CustomerPageViewController: UIPageViewController, UIPageViewControllerDataSource {

    var pageTitles = ["BasicInfo.", "Locate", "Discover"]
    var customerID: String = ""
    var customerName: String = ""
    var pageImages = ["homei", "mapintro", "fiveleaves"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self
        self.title = "業務夥伴資訊"
        // Create the first walkthrough screen
        if let startingVC = self.viewControllerAtIndex(0){
            setViewControllers([startingVC], direction: .Forward, animated: true, completion: nil)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        let object_type = Mirror(reflecting: viewController)
        var index = 0
        if(object_type.subjectType == CustomerViewController.self){
            index = (viewController as! CustomerViewController).index
        }else if(object_type.subjectType == ContactViewController.self){
            index = (viewController as! ContactViewController).index
        }
        index++
        return self.viewControllerAtIndex(index)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! CustomerViewController).index
        index--
        return self.viewControllerAtIndex(index)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func viewControllerAtIndex(index: Int) -> UIViewController?{
        if (index == NSNotFound || index < 0 || index >= self.pageTitles.count){
            return nil
        }
         if index == 0{
            if let customerViewController = storyboard?.instantiateViewControllerWithIdentifier("CustomerVC") as? CustomerViewController{
                
                customerViewController.lblTitle = pageTitles[index]
                customerViewController.customerID = customerID
                customerViewController.customerName = customerName
                customerViewController.index = index
                
                print(index)
                
                return customerViewController
            }
        }
        
        if index == 1{
           if let contactViewController = storyboard?.instantiateViewControllerWithIdentifier("ContactVC") as? ContactViewController{
            
                contactViewController.lblTitle = "Contact"
//                contactViewController.tel = "(02)0000-0000"
//                contactViewController.mail = "david@mail.com.tw"
//                contactViewController.contact = "Mary Brown"
//                contactViewController.website = "www.dda-tech.nethhh"
//                contactViewController.address = "1052-1054 Christchurch Road Bournemonth BH7 6DS United kingdom 00000"
            
                print(index)
                
                return contactViewController
            }
        }
        return nil
    }
    
//    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
//        return pageTitles.count
//    }
//    
//    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
//        if let customerViewController = storyboard?.instantiateViewControllerWithIdentifier("CustomerVC") as? CustomerViewController{
//             print(customerViewController.index)
//            return customerViewController.index
//        }
//        return 0
//    }

}
