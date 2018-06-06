//
//  ShouyeViewcontrooler.swift
//  会生活
//
//  Created by guest on 2018/6/1.
//  Copyright © 2018年 guest. All rights reserved.
//

import UIKit



class ShouyeViewcontrooler: BaseViewController {
    @IBOutlet weak var nrlabel: UILabel!
    var arr = [String]()
    var i = 0
    var arr1 = [String]()
    var selectedIndexs = [Int]()
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.isNavigationBarHidden = true
        
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setview()
        
    }
    func setview(){
        if !UserHelper.getRepayNoticeCanShow(){
            for _ in 0...9{
                let random = createRandomMan(start: 0,end: 15)
                arr.append(sjname.sjarr[Int(random())])
            }
            NSUser.setNormalDefault(key: "arr", value: arr)
            NSUser.setNormalDefault(key: UserHelper.getTodayTime(), value: "popWindowOnceADay1")
            nrlabel.text = arr[0]
        }else{
            arr = NSUser.getNormalDefault(key: "arr") as! [String]
            nrlabel.text = arr[0]
        }
    }
    
    @IBAction func tighttopbtn(_ sender: UIButton) {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.isNavigationBarHidden = false
//        if NSUser.getNormalDefault(key: "first") == nil{
//            let mainVc = UIStoryboard.init(name: "shouye", bundle: nil).instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
//            self.navigationController?.setNavigationBarHidden(false, animated: false)
//            self.navigationController?.pushViewController(mainVc, animated: true)
//        }else{
            let mainVc = UIStoryboard.init(name: "shouye", bundle: nil).instantiateViewController(withIdentifier: "IntroductionViewController") as! IntroductionViewController
            self.navigationController?.pushViewController(mainVc, animated: true)
//        }
    
    }
    @IBAction func tgbtn(_ sender: UIButton) {
        if i < arr.count - 1{
            let alertController = UIAlertController(title: "Prompt",
                                                    message: "Do you skip this goal?", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
            let okAction = UIAlertAction(title: "confirm", style: .default, handler: {
                action in
                self.i = (self.i + 1)
                self.nrlabel.text = self.arr[self.i]
            })
            alertController.addAction(cancelAction)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }else{
            SJProgressHUD.showOnlyText("There are no goals")
            i = arr.count - 1
            nrlabel.text = arr[i]
        }
        
    }
    @IBAction func dgbtn(_ sender: UIButton) {
        if i < arr.count - 1{
            i = (i + 1)
            SJProgressHUD.showOnlyText("You have achieved that goal")
            nrlabel.text = arr[i]
            self.arr1.append(arr[i])
            NSUser.setNormalDefault(key: "dgnm", value: arr1)
            
        }else{
            i = arr.count - 1
            nrlabel.text = arr[i]
            SJProgressHUD.showOnlyText("Your final goal")
        }
        
    }
    
    @IBAction func taskbtn(_ sender: UIButton) {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.isNavigationBarHidden = false
        let mainVc = UIStoryboard.init(name: "shouye", bundle: nil).instantiateViewController(withIdentifier: "RwViewController") as! RwViewController
        
        
//
        self.navigationController?.pushViewController(mainVc, animated: true)
    }
    
    @IBAction func prombtn(_ sender: UIButton) {
        let mainVc = UIStoryboard.init(name: "shouye", bundle: nil).instantiateViewController(withIdentifier: "MineViewcontroller") as! MineViewcontroller
        self.navigationController?.pushViewController(mainVc, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
