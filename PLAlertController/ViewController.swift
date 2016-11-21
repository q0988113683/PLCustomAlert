//
//  ViewController.swift
//  PLAlertController
//
//  Created by Yu chengJhuo on 11/20/16.
//  Copyright © 2016 Yu-cheng Jhuo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    @IBAction func btnclick2(){
        let alert = PLAlertViewController(title: "測試是否行", SuccessCompletion: {
            () in
        
        })
         self.present(alert, animated: true)
    }
    
    @IBAction func btnclick3(){
        let alert = PLAlertViewController(title: "test", leftText: "cancel", rightText: "OK", SuccessCompletion: {
            () in
            
            }, CancelCompletion: {
                () in
                
        })
        
        
        self.present(alert, animated: true)
    }
}

