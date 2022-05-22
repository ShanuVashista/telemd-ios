//
//  InvestigationViewController.swift
//  TelemedicineApp
//
//  Created by My Mac on 07/04/22.
//

import UIKit

class InvestigationViewController: UIViewController {
    
    @IBOutlet weak var btnLabTest: UIButton!
    @IBOutlet weak var btnPublicHealth: UIButton!
    @IBOutlet weak var btnXRay: UIButton!
    @IBOutlet weak var btnCTScan: UIButton!
    @IBOutlet weak var btnCardiology: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.btnLabTest.addShadow(offset: CGSize(width: 1.0, height: 1.0), color: .gray, radius: 5.0, opacity: 0.5)
        self.btnPublicHealth.addShadow(offset: CGSize(width: 1.0, height: 1.0), color: .gray, radius: 5.0, opacity: 0.5)
        self.btnXRay.addShadow(offset: CGSize(width: 1.0, height: 1.0), color: .gray, radius: 5.0, opacity: 0.5)
        self.btnCTScan.addShadow(offset: CGSize(width: 1.0, height: 1.0), color: .gray, radius: 5.0, opacity: 0.5)
        self.btnCardiology.addShadow(offset: CGSize(width: 1.0, height: 1.0), color: .gray, radius: 5.0, opacity: 0.5)
    }
}

extension InvestigationViewController
{
    @IBAction func btnBackClicked(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnLabTestClicked(_ sender: Any)
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "LabTestViewController") as! LabTestViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnPublicHealthClicked(_ sender: Any)
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ClinicalNoteViewController") as! ClinicalNoteViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
