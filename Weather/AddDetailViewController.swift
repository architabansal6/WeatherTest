//
//  AddDetailViewController.swift
//  Weather
//
//  Created by Archita Bansal on 8/16/16.
//  Copyright © 2016 iOS Meetup. All rights reserved.
//

import UIKit

protocol AddDetailsDelegate{
    func detailsAdded(city:String,temp:String)
}

class AddDetailViewController: UIViewController {

    @IBOutlet weak var outletNextBtn: UIButton!
    @IBOutlet weak var txtTemperature: UITextField!
    @IBOutlet weak var txtName: UITextField!
    
    weak var firstVC:ViewController?
   
    //var addDetailsDelegate : AddDetailsDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Add City / Temperature"
        
    }

    @IBAction func onNext(sender: UIButton) {
        
        if txtName.text != "" && txtTemperature.text != ""{
            
       // self.addDetailsDelegate?.detailsAdded(self.txtName.text!, temp: self.txtTemperature.text!)
            
          firstVC!.detailsAdded(self.txtName.text!, temp: self.txtTemperature.text!)
            
           self.navigationController?.popViewControllerAnimated(true)
        }else{
            
            let alertController = UIAlertController(title: "" , message: "Please fill all the details", preferredStyle: .Alert)
           
            alertController.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)

        }
    }
}

