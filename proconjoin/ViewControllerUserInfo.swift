//
//  ViewControllerUserInfo.swift
//  proconjoin
//
//  Created by 吉岡捺己 on 2017/12/11.
//  Copyright © 2017年 吉岡捺己. All rights reserved.
//

import UIKit

class ViewControllerUserInfo: UIViewController {
    @IBOutlet var nameLabel :UILabel!
    @IBOutlet var depLabel :UILabel!
    @IBOutlet var levelLabel :UILabel!
    @IBOutlet var classLabel :UILabel!
    @IBOutlet var confLabel :UILabel!
    @IBOutlet var saveBT :UIButton!
    @IBOutlet var backBT :UIButton!
    @IBOutlet var infodelBT :UIButton!
    
    @IBOutlet var nameTF :UITextField!
    @IBOutlet var depTF :UITextField!
    @IBOutlet var levelTF :UITextField!
    @IBOutlet var classTF :UITextField!
    
    let userdefault = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        confLabel.text = "設定"
        nameLabel.text = "名前:"
        depLabel.text = "学科:"
        levelLabel.text = "学年:"
        classLabel.text = "クラス:"
        
        confLabel.textAlignment = NSTextAlignment.center
        confLabel.font = UIFont.systemFont(ofSize: 30)
        
        let getName = userdefault.string(forKey: "name")
        let getDep = userdefault.string(forKey: "dep")
        let getClass = userdefault.string(forKey: "class")
        let getLevel = userdefault.string(forKey: "level")
        
        if(getName != nil){
            nameTF.text = getName
        }
        if(getDep != nil){
            depTF.text = getDep
        }
        if(getLevel != nil){
            levelTF.text = getLevel
        }
        if(getClass != nil){
            classTF.text = getClass
        }
        
        
        backBT.setTitle("戻る", for: .normal)
        backBT.backgroundColor = UIColor.gray
        backBT.setTitleColor(UIColor.white, for: .normal)
        backBT.layer.masksToBounds = true
        backBT.layer.cornerRadius = 10.0
        infodelBT.setTitle("データ削除", for: .normal)
        infodelBT.backgroundColor = UIColor.red
        infodelBT.setTitleColor(UIColor.black, for: .normal)
        infodelBT.layer.masksToBounds = true
        infodelBT.layer.cornerRadius = 10.0
        
        saveBT.setTitle("保存", for: .normal)
        saveBT.backgroundColor = UIColor.blue
        saveBT.setTitleColor(UIColor.white, for: .normal)
        saveBT.layer.masksToBounds = true
        saveBT.layer.cornerRadius = 10.0
    }
    
    @IBAction func saveBTPushued(){
        let userdefault = UserDefaults.standard
        
        let getInputName = nameTF.text!
        let getInputDep = depTF.text!
        let getInputLevel = levelTF.text!
        let getInputClass = classTF.text!
        userdefault.set(getInputName, forKey: "name")
        userdefault.set(getInputDep, forKey: "dep")
        userdefault.set(getInputLevel, forKey: "level")
        userdefault.set(getInputClass, forKey: "class")
    }
    
    @IBAction func deleteData(){
        UserDefaults.standard.removeObject(forKey: "name")
        UserDefaults.standard.removeObject(forKey: "dep")
        UserDefaults.standard.removeObject(forKey: "level")
        UserDefaults.standard.removeObject(forKey: "class")
    }
}
