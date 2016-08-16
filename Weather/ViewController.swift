//
//  ViewController.swift
//  Weather
//
//  Created by Archita Bansal on 8/15/16.
//  Copyright © 2016 iOS Meetup. All rights reserved.
//

import UIKit

class ViewController: UIViewController,AddDetailsDelegate {

    @IBOutlet weak var weatherTableView: UITableView!
    var cityNames = ["Bangalore","New Delhi","Mumbai","Hyderabad"]
    var cityTemperature = ["22","25","24","24"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.weatherTableView.dataSource = self
        self.weatherTableView.delegate = self
        self.weatherTableView.rowHeight = 55.0
        self.weatherTableView.separatorStyle = .SingleLine
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(animated: Bool) {
        
        
        
    }
    
    @IBAction func onAdd(sender: UIBarButtonItem) {
        
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("addDetail") as! AddDetailViewController
        controller.addDetailsDelegate = self
        self.navigationController?.pushViewController(controller, animated: true)

        
    }
    func detailsAdded(city: String, temp: String) {
        self.cityNames.append(city)
        self.cityTemperature.append(temp)
        self.weatherTableView.reloadData()
    }

    

}

extension ViewController : UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView(frame: CGRect.zero)
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cityTemperature.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        cell.textLabel?.text  = self.cityTemperature[indexPath.row]
        cell.detailTextLabel?.text = self.cityNames[indexPath.row]
        cell.selectionStyle = .None
        return cell
    }
    
    
    
}

