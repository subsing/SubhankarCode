//
//  ViewController.swift
//  AlamoFirePOC
//
//  Created by Expedia on 28/02/17.
//  Copyright © 2017 Subhankar. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    @IBOutlet weak var myLabel: UILabel!
    var parsedDictionary = [[String:AnyObject]]() //Array of dictionary

    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("http://api.androidhive.info/contacts/").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                print(swiftyJsonVar)
                if let resData = swiftyJsonVar["contacts"].arrayObject {
                    self.parsedDictionary = resData as! [[String:AnyObject]]
                }
                var dict = self.parsedDictionary[0]
                self.myLabel.text = dict["name"] as? String
            }
        }
        let URL = "https://raw.githubusercontent.com/tristanhimmelman/AlamofireObjectMapper/d8bb95982be8a11a2308e779bb9a9707ebe42ede/sample_json"
        Alamofire.request(URL).responseJSON { (responseData1) in
            
        }
    }

}


