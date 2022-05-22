//
//  LabTestViewController.swift
//  TelemedicineApp
//
//  Created by My Mac on 07/04/22.
//

import UIKit
import WebKit

class LabTestViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var lblPatientCheck: UILabel!
    @IBOutlet weak var btnPatientCheck: UIButton!
    @IBOutlet weak var lblLabCheck: UILabel!
    @IBOutlet weak var btnLabCheck: UIButton!
    @IBOutlet weak var btnSubmit: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url: URL! = URL(string: "http://developer.apple.com/iphone/library/documentation/UIKit/Reference/UIWebView_Class/UIWebView_Class.pdf")
        webView.load(URLRequest(url: url))
        
        self.btnSubmit.addShadow(offset: CGSize(width: 1.0, height: 1.0), color: .gray, radius: 5.0, opacity: 0.5)
    }
}

extension LabTestViewController
{
    @IBAction func btnBackClicked(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnPatientCheckClicked(_ sender: Any)
    {
        if self.lblPatientCheck.backgroundColor == UIColor.white {
            self.lblPatientCheck.backgroundColor = UIColor.systemYellow
            self.btnPatientCheck.setBackgroundImage(UIImage(systemName: "checkmark.square"), for: .normal)
        } else {
            self.lblPatientCheck.backgroundColor = UIColor.white
            self.btnPatientCheck.setBackgroundImage(UIImage(systemName: "square"), for: .normal)
        }
    }
    
    @IBAction func btnLabCheckClicked(_ sender: Any)
    {
        if self.lblLabCheck.backgroundColor == UIColor.white {
            self.lblLabCheck.backgroundColor = UIColor.systemYellow
            self.btnLabCheck.setBackgroundImage(UIImage(systemName: "checkmark.square"), for: .normal)
        } else {
            self.lblLabCheck.backgroundColor = UIColor.white
            self.btnLabCheck.setBackgroundImage(UIImage(systemName: "square"), for: .normal)
        }
    }
    
    @IBAction func btnNextClicked(_ sender: Any)
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SelectLabViewController") as! SelectLabViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
