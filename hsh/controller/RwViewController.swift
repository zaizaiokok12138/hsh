//
//  RwViewController.swift
//  hsh
//
//  Created by guest on 2018/6/1.
//  Copyright © 2018年 guest. All rights reserved.
//

import UIKit

class RwViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var MainTableview: UITableView!
    var arr = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Task Record"
        setView()
    }
    
    func setView(){
        if NSUser.getNormalDefault(key: "dgnm") != nil{
            self.arr = NSUser.getNormalDefault(key: "dgnm") as!  [String]
        }
        self.MainTableview.delegate =  self
        self.MainTableview.dataSource = self
        self.MainTableview.tableFooterView = UIView()
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    @IBAction func back(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RwTableViewcell") as! RwTableViewcell
        cell.selectionStyle = .none
        if arr.count != 0{
            cell.nrlabel.text = arr[indexPath.row]
        }else{
            cell.nrlabel.text = ""
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

