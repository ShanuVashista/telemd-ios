//
//  DoctorSignup1ViewController.swift
//  TelemedicineApp
//
//  Created by My Mac on 06/04/22.
//

import UIKit

class DoctorSignup1ViewController: UIViewController {
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    @IBOutlet weak var btnNext: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.txtEmail.setLeftPaddingPoints(10)
        self.txtPassword.setLeftPaddingPoints(10)
        self.txtConfirmPassword.setLeftPaddingPoints(10)

        self.txtEmail.setRightPaddingPoints(10)
        self.txtPassword.setRightPaddingPoints(10)
        self.txtConfirmPassword.setRightPaddingPoints(10)
        
        self.btnNext.addShadow(offset: CGSize(width: 1.0, height: 1.0), color: .gray, radius: 5.0, opacity: 0.5)
    }
    
    @IBAction func btnNextClicked(_ sender: Any)
    {
        let vc = storyboard?.instantiateViewController(withIdentifier:"DoctorCreateProfile1ViewController") as! DoctorCreateProfile1ViewController
        vc.email = self.txtEmail.text ?? ""
        vc.password = self.txtPassword.text ?? ""
        self.navigationController?.pushViewController(vc, animated: true)
//        if NullCheck.checkNullNil(self.txtEmail.text!) {
//            AlertMessage.displayAlertMessage(message: "Please enter email address.")
//        } else if !NullCheck.isValidEmail(email: self.txtEmail.text!) {
//            AlertMessage.displayAlertMessage(message: "Please enter valid email address.")
//        } else if NullCheck.checkNullNil(self.txtPassword.text!) {
//            AlertMessage.displayAlertMessage(message: "Please enter password.")
//        } else if self.txtPassword.text != self.txtConfirmPassword.text {
//            AlertMessage.displayAlertMessage(message: "Password and confirm password should same.")
//        } else {
//            let vc = storyboard?.instantiateViewController(withIdentifier:"DoctorCreateProfile1ViewController") as! DoctorCreateProfile1ViewController
//            vc.email = self.txtEmail.text ?? ""
//            vc.password = self.txtPassword.text ?? ""
//            self.navigationController?.pushViewController(vc, animated: true)
//        }
    }
}
