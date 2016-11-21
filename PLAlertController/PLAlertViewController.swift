//
//  PLAlertViewController.swift
//  PLAlertController
//
//  Created by Yu chengJhuo on 11/20/16.
//  Copyright © 2016 Yu-cheng Jhuo. All rights reserved.
//

import UIKit


public typealias SuccessCompletion = () -> Void

public typealias CancelCompletion = () -> Void

class PLAlertViewController: UIViewController {


    var TitleMsg = ""
    var leftText = "取消"
    var rightText = "確定"
    var centerText = "確定"
    @IBOutlet weak var labTitle: UILabel!
    @IBOutlet weak var btnType1Right: UIButton!
    @IBOutlet weak var btnType1Left: UIButton!
    @IBOutlet weak var btnType2: UIButton!
    
     var onComSuccessCompletion: SuccessCompletion?
     var onCancelCompletion: CancelCompletion?
    var transitioner : CAVTransitioner
    var type = 1
    
    
    
    init(title: String, SuccessCompletion: @escaping SuccessCompletion) {
        self.transitioner = CAVTransitioner()
        super.init(nibName: nil, bundle: nil)
        self.TitleMsg = title
        self.onComSuccessCompletion = SuccessCompletion
        
        
        self.type = 1
        self.modalPresentationStyle = .custom
        self.transitioningDelegate = self.transitioner
        
    }
    
    init(title: String , leftText :String , rightText:String ,  SuccessCompletion: @escaping SuccessCompletion , CancelCompletion : @escaping SuccessCompletion ) {
        self.transitioner = CAVTransitioner()
        super.init(nibName: nil, bundle: nil)
        self.TitleMsg = title
        self.leftText = leftText
        self.rightText = rightText
        self.onComSuccessCompletion = SuccessCompletion
        self.onCancelCompletion = CancelCompletion
        
       
        self.type = 2
        self.modalPresentationStyle = .custom
        self.transitioningDelegate = self.transitioner
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.labTitle.text = self.TitleMsg
        
        switch self.type {
        case 1:
            self.btnType1Left.isHidden = true
            self.btnType1Right.isHidden = true
            
            
            self.btnType2.isHidden = false
            self.btnType2.setTitle(self.centerText, for: .normal)
            self.btnType2.addTarget(self, action: #selector(PLAlertViewController.centerClick(_:)), for: .touchUpInside)

            let border = CALayer()
            border.frame = CGRect.init(x: 0, y: 0, width: self.view.frame.width, height: 1.0)
            border.backgroundColor = UIColor.groupTableViewBackground.cgColor;
            self.btnType2.layer.addSublayer(border)
            
            break
        case 2:
            self.btnType1Left.isHidden = false
            self.btnType1Right.isHidden = false
            self.btnType2.isHidden = true
            self.btnType1Left.setTitle(self.rightText, for: .normal)
            self.btnType1Right.setTitle(self.leftText, for: .normal)
            
            let border = CALayer()
            border.frame = CGRect.init(x: 0, y: 0, width: self.view.frame.width/2, height: 1.0)
            border.backgroundColor = UIColor.groupTableViewBackground.cgColor;
            self.btnType1Left.layer.addSublayer(border)
            
            
            
            
            let border1 = CALayer()
            border1.frame = CGRect.init(x: 0, y: 0, width: self.view.frame.width/2, height: 1.0)
            border1.backgroundColor = UIColor.groupTableViewBackground.cgColor;
            self.btnType1Right.layer.addSublayer(border1)
            
            let border2 = CALayer()
            border2.frame = CGRect.init(x: 0, y: 0, width: 1.0, height: 37)
            border2.backgroundColor = UIColor.groupTableViewBackground.cgColor;
            self.btnType1Right.layer.addSublayer(border2)
            
            
            break
        default:
            break
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func leftClick(){
        self.onCancelCompletion!()
        self.hideView()
    }
    
    @IBAction func rightClick(){
        self.onComSuccessCompletion!()
        self.hideView()
    }

    @IBAction func centerClick(_ sender: AnyObject) {
        self.onComSuccessCompletion!()
        self.hideView()
    }
    
    // Close SCLAlertView
    open func hideView() {
         self.presentingViewController?.dismiss(animated: true, completion: nil)
    }

}
