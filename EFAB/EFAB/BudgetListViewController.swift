//
//  BudgetListViewController.swift
//  EFAB
//
//  Created by Deb Ramey on 11/1/16.
//  Copyright © 2016 Deb Ramey. All rights reserved.
//

import UIKit
import MBProgressHUD

class BudgetListViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeControl: UISegmentedControl!
    @IBOutlet weak var forwardTapped: UIButton!
    @IBOutlet weak var backtapped: UIButton!
    
    //pulldown refresh
    let refreshControl = UIRefreshControl()
    var currentDate = Utils.adjustedTime()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        refreshControl.addTarget(self, action: #selector(BudgetListViewController.loadCategories), for: .valueChanged)
        tableView.addSubview(refreshControl)
        
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if !WebServices.shared.userAuthTokenExists() || WebServices.shared.userAuthTokenExpired(){
            performSegue(withIdentifier: "PresentLoginNoAnimation", sender: self)
        }
        
        
    }
    func loadCategories(){
        print("refresh")
        self.refreshControl.endRefreshing()
    
    }

    @IBAction func logouttapped(_ sender: Any) {
        UserStore.shared.logout{
            self.performSegue(withIdentifier: "PresentLogin", sender: self)
        }
    }
    
    @IBAction func forwardTapped(_ sender: Any) {
        //print("forward")  //test
    }
    
    @IBAction func backTapped(_ sender: Any) {
        //print("back")  //test
    }

    @IBAction func timePeriodChange(_ sender: AnyObject) {
    }
    //override func didReceiveMemoryWarning() {
        //super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
   // }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
