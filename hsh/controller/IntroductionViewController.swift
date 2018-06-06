//
//  IntroductionViewController.swift
//  hsh
//
//  Created by guest on 2018/6/4.
//  Copyright © 2018年 guest. All rights reserved.
//

import UIKit

class IntroductionViewController: BaseViewController {
    @IBOutlet weak var IntroductionTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setView()
    }
    @IBAction func bcakbtnm(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    func setView(){
        self.title = "Introduction"
        self.IntroductionTextView.text = "Healthy life refers to the healthy habituation behavior pattern, which is embodied in regular life, no bad habits, and pays attention to personal, environmental and dietary hygiene. We are scientific and non-superstitious, pay attention to health care at ordinary times, seek medical treatment when we are ill, and actively participate in healthy sports and social activities.         Let your health change your life! The concept of leading the world and enjoying the dignity alone is what people are pursuing now. People live a healthy life and have the spirit of motivation, innovation and inclusiveness."
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
