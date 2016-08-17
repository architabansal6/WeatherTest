//
//  ViewController.swift
//  Weather
//
//  Created by Archita Bansal on 8/15/16.
//  Copyright © 2016 iOS Meetup. All rights reserved.
//

import UIKit

class ViewController: UIViewController,AddDetailsDelegate,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var weatherTableView: UITableView!
    var cityNames = ["Bangalore","New Delhi","Mumbai","Hyderabad"]
    var cityTemperature = ["22","25","24","24"]
    
    //MARK: VIEW CONTROLLER METHODS

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.weatherTableView.dataSource = self
        self.weatherTableView.delegate = self
        self.weatherTableView.rowHeight = 55.0
        self.weatherTableView.separatorStyle = .SingleLine
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(animated: Bool) {
        
        self.title = "Indian City Temperatures"
    }
    
    //MARK: ACTION METHODS
    
    @IBAction func onAdd(sender: UIBarButtonItem) {
        
        
        self.performSegueWithIdentifier("showDetail", sender: self)
        
        /*let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("addDetail") as! AddDetailViewController
        controller.addDetailsDelegate = self
        self.navigationController?.pushViewController(controller, animated: true)*/
        
    }

    
    func detailsAdded(city: String, temp: String) {
        self.cityNames.append(city)
        self.cityTemperature.append(temp)
        self.weatherTableView.reloadData()
    }

    
    //MARK: TABLEVIEW DATASOURCE
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView(frame: CGRect.zero)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80.0
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cityTemperature.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        let cellFont = UIFont(name:"Arial", size:25)
        
        cell.textLabel?.font  = cellFont
        cell.detailTextLabel?.font  = cellFont
        
        
        cell.textLabel?.text  = self.cityNames[indexPath.row]
        cell.detailTextLabel?.text = self.cityTemperature[indexPath.row]
        
        cell.selectionStyle = .None
        return cell
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
       
        if(segue.identifier == "showDetail")
        {
            let destinationVC:AddDetailViewController = segue.destinationViewController as! AddDetailViewController
            destinationVC.firstVC = self;
            
        }
    }

}

/*extension ViewController : UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView(frame: CGRect.zero)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80.0
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cityTemperature.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        let cellFont = UIFont(name:"Arial", size:25)
        
        cell.textLabel?.font  = cellFont
        cell.detailTextLabel?.font  = cellFont

        
        cell.textLabel?.text  = self.cityNames[indexPath.row]
        cell.detailTextLabel?.text = self.cityTemperature[indexPath.row]

        cell.selectionStyle = .None
        return cell
    }
    
    
    
}
*/
