//
//  SickNoteViewController.swift
//  TelemedicineApp
//
//  Created by My Mac on 07/04/22.
//

import UIKit

class SickNoteViewController: UIViewController {
    
    @IBOutlet weak var lblPatientSickCheck: UILabel!
    @IBOutlet weak var btnPatientSickCheck: UIButton!
    @IBOutlet weak var txtSickFrom: UITextField!
    @IBOutlet weak var txtSickTo: UITextField!
    @IBOutlet weak var lblBedrestCheck: UILabel!
    @IBOutlet weak var btnBedrestCheck: UIButton!
    @IBOutlet weak var txtBedrestDays: UITextField!
    @IBOutlet weak var lblPatientFollowUpCheck: UILabel!
    @IBOutlet weak var btnPatientFollowUpCheck: UIButton!
    @IBOutlet weak var txtFollowUpDays: UITextField!
    @IBOutlet weak var txtFollowUpDaysNo: UITextField!
    @IBOutlet weak var lblPhysioCheck: UILabel!
    @IBOutlet weak var btnPhysioCheck: UIButton!
    @IBOutlet weak var lblMassageCheck: UILabel!
    @IBOutlet weak var btnMassageCheck: UIButton!
    @IBOutlet weak var lblChiropractorCheck: UILabel!
    @IBOutlet weak var btnChiropractorCheck: UIButton!
    @IBOutlet weak var lblOthersCheck: UILabel!
    @IBOutlet weak var btnOthersCheck: UIButton!
    @IBOutlet weak var tvNote: UITextView!
    @IBOutlet weak var btnSubmit: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.txtSickFrom.setLeftPaddingPoints(10)
        self.txtSickTo.setLeftPaddingPoints(10)
        self.txtBedrestDays.setLeftPaddingPoints(10)
        self.txtFollowUpDays.setLeftPaddingPoints(10)
        self.txtFollowUpDaysNo.setLeftPaddingPoints(10)
        
        self.txtSickFrom.setRightPaddingPoints(10)
        self.txtSickTo.setRightPaddingPoints(10)
        self.txtBedrestDays.setRightPaddingPoints(10)
        self.txtFollowUpDays.setRightPaddingPoints(10)
        self.txtFollowUpDaysNo.setRightPaddingPoints(10)
        
        self.btnSubmit.addShadow(offset: CGSize(width: 1.0, height: 1.0), color: .gray, radius: 5.0, opacity: 0.5)
    }
}

extension SickNoteViewController
{
    @IBAction func btnBackClicked(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnPatientSickCheckClicked(_ sender: Any)
    {
        if self.lblPatientSickCheck.backgroundColor == UIColor.white {
            self.lblPatientSickCheck.backgroundColor = UIColor.systemYellow
            self.btnPatientSickCheck.setBackgroundImage(UIImage(systemName: "checkmark.square"), for: .normal)
        } else {
            self.lblPatientSickCheck.backgroundColor = UIColor.white
            self.btnPatientSickCheck.setBackgroundImage(UIImage(systemName: "square"), for: .normal)
        }
    }
    
    @IBAction func btnBedrestCheckClicked(_ sender: Any)
    {
        if self.lblBedrestCheck.backgroundColor == UIColor.white {
            self.lblBedrestCheck.backgroundColor = UIColor.systemYellow
            self.btnBedrestCheck.setBackgroundImage(UIImage(systemName: "checkmark.square"), for: .normal)
        } else {
            self.lblBedrestCheck.backgroundColor = UIColor.white
            self.btnBedrestCheck.setBackgroundImage(UIImage(systemName: "square"), for: .normal)
        }
    }
    
    @IBAction func btnPatientFollowUpCheckClicked(_ sender: Any)
    {
        if self.lblPatientFollowUpCheck.backgroundColor == UIColor.white {
            self.lblPatientFollowUpCheck.backgroundColor = UIColor.systemYellow
            self.btnPatientFollowUpCheck.setBackgroundImage(UIImage(systemName: "checkmark.square"), for: .normal)
        } else {
            self.lblPatientFollowUpCheck.backgroundColor = UIColor.white
            self.btnPatientFollowUpCheck.setBackgroundImage(UIImage(systemName: "square"), for: .normal)
        }
    }
    
    @IBAction func btnPhysioCheckClicked(_ sender: Any)
    {
        if self.lblPhysioCheck.backgroundColor == UIColor.white {
            self.lblPhysioCheck.backgroundColor = UIColor.systemYellow
            self.btnPhysioCheck.setBackgroundImage(UIImage(systemName: "checkmark.square"), for: .normal)
        } else {
            self.lblPhysioCheck.backgroundColor = UIColor.white
            self.btnPhysioCheck.setBackgroundImage(UIImage(systemName: "square"), for: .normal)
        }
    }
    
    @IBAction func btnMassageCheckClicked(_ sender: Any)
    {
        if self.lblMassageCheck.backgroundColor == UIColor.white {
            self.lblMassageCheck.backgroundColor = UIColor.systemYellow
            self.btnMassageCheck.setBackgroundImage(UIImage(systemName: "checkmark.square"), for: .normal)
        } else {
            self.lblMassageCheck.backgroundColor = UIColor.white
            self.btnMassageCheck.setBackgroundImage(UIImage(systemName: "square"), for: .normal)
        }
    }
    
    @IBAction func btnChiropractorCheckClicked(_ sender: Any)
    {
        if self.lblChiropractorCheck.backgroundColor == UIColor.white {
            self.lblChiropractorCheck.backgroundColor = UIColor.systemYellow
            self.btnChiropractorCheck.setBackgroundImage(UIImage(systemName: "checkmark.square"), for: .normal)
        } else {
            self.lblChiropractorCheck.backgroundColor = UIColor.white
            self.btnChiropractorCheck.setBackgroundImage(UIImage(systemName: "square"), for: .normal)
        }
    }
    
    @IBAction func btnOthersCheckClicked(_ sender: Any)
    {
        if self.lblOthersCheck.backgroundColor == UIColor.white {
            self.lblOthersCheck.backgroundColor = UIColor.systemYellow
            self.btnOthersCheck.setBackgroundImage(UIImage(systemName: "checkmark.square"), for: .normal)
        } else {
            self.lblOthersCheck.backgroundColor = UIColor.white
            self.btnOthersCheck.setBackgroundImage(UIImage(systemName: "square"), for: .normal)
        }
    }
    
    @IBAction func btnNextClicked(_ sender: Any)
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SelectLabViewController") as! SelectLabViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
