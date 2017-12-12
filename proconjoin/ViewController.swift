//
//  ViewController.swift
//  proconjoin
//
//  Created by 吉岡捺己 on 2017/12/11.
//  Copyright © 2017年 吉岡捺己. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var joinBt :UIButton!
    @IBOutlet var userBt :UIButton!
    @IBOutlet var titleLabel :UILabel!
    let userdefault = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        joinBt.setTitle("Join!", for: .normal)
        joinBt.backgroundColor = UIColor.green
        joinBt.setTitleColor(UIColor.black, for: .normal)
        joinBt.layer.masksToBounds = true
        joinBt.layer.cornerRadius = 10.0
        userBt.setTitle("設定", for: .normal)
        userBt.backgroundColor = UIColor.gray
        userBt.setTitleColor(UIColor.white, for: .normal)
        userBt.layer.masksToBounds = true
        userBt.layer.cornerRadius = 10.0
        
        titleLabel.text = "プロコン Join"
        titleLabel.textAlignment = NSTextAlignment.center
        titleLabel.font = UIFont.systemFont(ofSize: 30)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sednBt(sender: AnyObject){
        if(userdefault.string(forKey: "name") != nil && userdefault.string(forKey: "dep") != nil){
            let name = userdefault.string(forKey: "name")
            let dep = userdefault.string(forKey: "dep")
            let level = userdefault.string(forKey: "level")
            let cl = userdefault.string(forKey: "class")
            
            let url = "https://kdproconjoin.herokuapp.com/join/api"
            
            let params: [String: AnyObject] = [ "department": dep as AnyObject,
                                              "schoolYear": level as AnyObject,
                                              "classno": cl as AnyObject,
                                              "familyName": name as AnyObject
                                            ]
            
            var request = NSMutableURLRequest(url: NSURL(string: url)! as URL)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            do{
                request.httpBody = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
                let task:URLSessionDataTask = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: {(data,response,error) -> Void in
                    let resultData = String(data: data!, encoding: .utf8)!
                    print("result:\(resultData)")
                    print("response:\(response)")
                    
                })
                task.resume()
               
            }catch{
                print("send error")
            }
            
        }
    }

}

