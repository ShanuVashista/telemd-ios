//
//  DoctorAddAppointmentViewController.swift
//  TelemedicineApp
//
//  Created by My Mac on 07/04/22.
//

import UIKit

class DoctorAddAppointmentViewController: UIViewController {
    
    @IBOutlet weak var btnClinicalNote: UIButton!
    @IBOutlet weak var btnInvestigation: UIButton!
    @IBOutlet weak var btnPrescription: UIButton!
    @IBOutlet weak var btnTakePicture: UIButton!
    @IBOutlet weak var btnReferral: UIButton!
    @IBOutlet weak var btnSickNote: UIButton!
    @IBOutlet weak var vwSickNote: UIView!
    @IBOutlet weak var btnProbono: UIButton!
    @IBOutlet weak var btnLockedNote: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.btnClinicalNote.addShadow(offset: CGSize(width: 1.0, height: 1.0), color: .gray, radius: 5.0, opacity: 0.5)
        self.btnInvestigation.addShadow(offset: CGSize(width: 1.0, height: 1.0), color: .gray, radius: 5.0, opacity: 0.5)
        self.btnPrescription.addShadow(offset: CGSize(width: 1.0, height: 1.0), color: .gray, radius: 5.0, opacity: 0.5)
        self.btnTakePicture.addShadow(offset: CGSize(width: 1.0, height: 1.0), color: .gray, radius: 5.0, opacity: 0.5)
        self.btnReferral.addShadow(offset: CGSize(width: 1.0, height: 1.0), color: .gray, radius: 5.0, opacity: 0.5)
        self.btnSickNote.addShadow(offset: CGSize(width: 1.0, height: 1.0), color: .gray, radius: 5.0, opacity: 0.5)
        
        self.vwSickNote.isHidden = true
    }
}

extension DoctorAddAppointmentViewController
{
    @IBAction func btnBackClicked(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnClinicalNoteClicked(_ sender: Any)
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ClinicalNoteViewController") as! ClinicalNoteViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnInvestigationClicked(_ sender: Any)
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "InvestigationViewController") as! InvestigationViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnPrescriptionClicked(_ sender: Any)
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "PrescriptionViewController") as! PrescriptionViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnReferralClicked(_ sender: Any)
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ReferralViewController") as! ReferralViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnSickNoteClicked(_ sender: Any)
    {
        self.vwSickNote.isHidden = false
    }
    
    @IBAction func btnSickNoteCloseClicked(_ sender: Any)
    {
        self.vwSickNote.isHidden = true
    }
    
    @IBAction func btnProBonoCheckeClicked(_ sender: Any)
    {
        if self.btnProbono.tag == 0 {
            self.btnProbono.tag = 1
            self.btnProbono.setBackgroundImage(UIImage(systemName: "checkmark.square"), for: .normal)
        } else {
            self.btnProbono.tag = 0
            self.btnProbono.setBackgroundImage(UIImage(systemName: "square"), for: .normal)
        }
    }
    
    @IBAction func btnLockedNoteClicked(_ sender: Any)
    {
        if self.btnLockedNote.tag == 0 {
            self.btnLockedNote.tag = 1
            self.btnLockedNote.setBackgroundImage(UIImage(systemName: "checkmark.square"), for: .normal)
        } else {
            self.btnLockedNote.tag = 0
            self.btnLockedNote.setBackgroundImage(UIImage(systemName: "square"), for: .normal)
        }
    }
    
    @IBAction func btnSickNoteSubmitClicked(_ sender: Any)
    {
        self.vwSickNote.isHidden = true
        let vc = storyboard?.instantiateViewController(withIdentifier: "SickNoteViewController") as! SickNoteViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
