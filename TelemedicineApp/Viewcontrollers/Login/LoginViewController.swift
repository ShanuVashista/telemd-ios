//
//  LoginViewController.swift
//  TelemedicineApp
//
//  Created by Bhavik Darji on 30/03/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Refference outlet and variables
    @IBOutlet weak var tf_email: UITextField!
    @IBOutlet weak var tf_password: UITextField!
    @IBOutlet weak var btnSignIn: UIButton!
    @IBOutlet weak var btnGoogle: UIButton!
    @IBOutlet weak var btnApple: UIButton!
    
    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tf_email.setLeftPaddingPoints(10)
        self.tf_password.setLeftPaddingPoints(10)
        self.tf_email.setRightPaddingPoints(10)
        self.tf_password.setRightPaddingPoints(10)
        
        self.btnSignIn.addShadow(offset: CGSize(width: 1.0, height: 1.0), color: .gray, radius: 5.0, opacity: 0.5)
        self.btnGoogle.addShadow(offset: CGSize(width: 1.0, height: 1.0), color: .gray, radius: 5.0, opacity: 0.5)
        self.btnApple.addShadow(offset: CGSize(width: 1.0, height: 1.0), color: .gray, radius: 5.0, opacity: 0.5)
    }
}

// MARK: - IBAction's

extension LoginViewController
{
    @IBAction func btn_Forgotpasswordclick(_ sender: Any)
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ForgotPasswordViewController") as! ForgotPasswordViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btn_Signinclick(_ sender: Any)
    {
        
    }

    @IBAction func btn_Signupclick(_ sender: Any)
    {
        if UserDefaults.standard.value(forKey: "UserType") as! String == "Patient" {
            let vc = storyboard?.instantiateViewController(withIdentifier: "CreateProfile1ViewController") as! CreateProfile1ViewController
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            let vc = storyboard?.instantiateViewController(withIdentifier: "DoctorSignup1ViewController") as! DoctorSignup1ViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func btn_Googleclick(_ sender: Any)
    {
        
    }

    @IBAction func btn_Appleclick(_ sender: Any)
    {
        
    }
    
    @IBAction func btn_Eyeclick(_ sender: Any)
    {
        if self.tf_password.isSecureTextEntry{
            self.tf_password.isSecureTextEntry = false
        }else{
            self.tf_password.isSecureTextEntry = true
        }
    }


}
