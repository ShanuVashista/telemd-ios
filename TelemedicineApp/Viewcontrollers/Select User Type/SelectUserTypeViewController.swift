//
//  SelectUserTypeViewController.swift
//  TelemedicineApp
//
//  Created by Bhavik Darji on 30/03/22.
//

import UIKit

class SelectUserTypeViewController: UIViewController {

    // MARK: - Refference outlet and variables

    
    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}

// MARK: - IBAction's

extension SelectUserTypeViewController
{
    @IBAction func btn_Physicianloginclick(_ sender: Any)
    {
        print("yellow")
        UserDefaults.standard.setValue("Doctor", forKey: "UserType")
        UserDefaults.standard.synchronize()
        let vc = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btn_Patientloginclick(_ sender: Any)
    {
        print("gray")
        UserDefaults.standard.setValue("Patient", forKey: "UserType")
        UserDefaults.standard.synchronize()
        let vc = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
