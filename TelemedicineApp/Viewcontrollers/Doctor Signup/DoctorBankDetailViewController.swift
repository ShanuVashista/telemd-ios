//
//  DoctorBankDetailViewController.swift
//  TelemedicineApp
//
//  Created by My Mac on 06/04/22.
//

import UIKit

class DoctorBankDetailViewController: UIViewController {
    
    @IBOutlet weak var txtBankName: UITextField!
    @IBOutlet weak var txtAccountHolderName: UITextField!
    @IBOutlet weak var txtAccountNumber: UITextField!
    @IBOutlet weak var txtBranchCode: UITextField!
    @IBOutlet weak var btnSubmit: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.txtBankName.setLeftPaddingPoints(10)
        self.txtAccountHolderName.setLeftPaddingPoints(10)
        self.txtAccountNumber.setLeftPaddingPoints(10)
        self.txtBranchCode.setLeftPaddingPoints(10)

        self.txtBankName.setRightPaddingPoints(10)
        self.txtAccountHolderName.setRightPaddingPoints(10)
        self.txtAccountNumber.setRightPaddingPoints(10)
        self.txtBranchCode.setRightPaddingPoints(10)
        
        self.btnSubmit.addShadow(offset: CGSize(width: 1.0, height: 1.0), color: .gray, radius: 5.0, opacity: 0.5)
    }
}

extension DoctorBankDetailViewController
{
    @IBAction func btnSubmitClikced(_ sender: Any)
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DoctorCongratulationViewController") as! DoctorCongratulationViewController
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }
}

