//
//  ReferralViewController.swift
//  TelemedicineApp
//
//  Created by My Mac on 07/04/22.
//

import UIKit

class ReferralViewController: UIViewController {
    
    @IBOutlet weak var txtReason: UITextField!
    @IBOutlet weak var tvHPI: UITextView!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var btnSubmit: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tvHPI.layer.borderWidth = 1
        self.tvHPI.layer.cornerRadius = 5
        self.tvHPI.layer.borderColor = UIColor.lightGray.cgColor
        
        self.txtReason.setLeftPaddingPoints(10)
        self.txtEmail.setLeftPaddingPoints(10)

        self.txtReason.setRightPaddingPoints(10)
        self.txtEmail.setRightPaddingPoints(10)
        
        self.btnSubmit.addShadow(offset: CGSize(width: 1.0, height: 1.0), color: .gray, radius: 5.0, opacity: 0.5)
    }
}

extension ReferralViewController
{
    @IBAction func btnBackClicked(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnSubmitClicked(_ sender: Any)
    {
        
    }
}
