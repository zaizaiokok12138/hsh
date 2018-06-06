//
//  MineViewcontroller.swift
//  hsh
//
//  Created by guest on 2018/6/1.
//  Copyright © 2018年 guest. All rights reserved.
//

import UIKit

class MineViewcontroller: BaseViewController{
    @IBOutlet weak var zjdlabel: UILabel!
    @IBOutlet weak var jrlable: UILabel!
    @IBOutlet weak var hylable: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.isNavigationBarHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setView()
    }
    func setView(){
        if (NSUser.getNormalDefault(key: "dgnm") != nil) && NSUser.getNormalDefault(key: "arr") != nil{
            let arrs = NSUser.getNormalDefault(key: "dgnm") as! [String]
            let arr1 = NSUser.getNormalDefault(key: "arr") as! [String]
            let arr3 = sjname.sjarr
            let num1 = Float((arrs.count)) / Float((arr1.count))
            let num2 = Float((arrs.count)) / Float((arr3.count))
            zjdlabel.text = "\(num2 * 100)"
            jrlable.text = "\(num1 * 100)"
        }else{
            zjdlabel.text = "0"
            jrlable.text = "0"
        }
        hylable.text = "Live healthy every day!"
    }
    
    @IBAction func sxbtn(_ sender: UIButton) {
        self.setView()
    }
    @IBAction func backbtn(_ sender: UIButton) {
//        self.navigationController?.navigationBar.isHidden = false
//        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
