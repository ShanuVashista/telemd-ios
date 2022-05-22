//
//  DoctorCongratulationViewController.swift
//  TelemedicineApp
//
//  Created by My Mac on 06/04/22.
//

import UIKit

class DoctorCongratulationViewController: UIViewController {
    
    @IBOutlet weak var btnOk: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.btnOk.addShadow(offset: CGSize(width: 1.0, height: 1.0), color: .gray, radius: 5.0, opacity: 0.5)
    }
}

extension DoctorCongratulationViewController
{
    @IBAction func btnOkClikced(_ sender: Any)
    {
        let navigationController = self.presentingViewController as! UINavigationController
        let vc = storyboard?.instantiateViewController(withIdentifier: "DoctorHomeViewController") as! DoctorHomeViewController
        self.dismiss(animated: true, completion: nil)
        navigationController.pushViewController(vc, animated: true)
    }
}

