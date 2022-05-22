//
//  DoctorProfileViewController.swift
//  TelemedicineApp
//
//  Created by My Mac on 08/04/22.
//

import UIKit

class DoctorProfileViewController: UIViewController {
    
    // MARK: - Refference outlet and variables
    @IBOutlet weak var ivProfile: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var btnGeneralInfo: UIButton!
    @IBOutlet weak var btnProfessionalInfo: UIButton!
    @IBOutlet weak var btnLicense: UIButton!
    @IBOutlet weak var tbPersonalInfo: UITableView!
    @IBOutlet weak var personalInfoHeight: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.btnGeneralInfoClicked(btnGeneralInfo!)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.tbPersonalInfo.layoutIfNeeded()
        self.view.layoutIfNeeded()
        self.personalInfoHeight.constant = CGFloat(self.tbPersonalInfo.contentSize.height)
    }
}

extension DoctorProfileViewController
{
    @IBAction func btnBackClicked(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnEditProfileClicked(_ sender: Any)
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DoctorEditProfile1ViewController") as! DoctorEditProfile1ViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnGeneralInfoClicked(_ sender: Any)
    {
        self.tbPersonalInfo.tag = 1
        self.tbPersonalInfo.reloadData()
        self.tbPersonalInfo.layoutIfNeeded()
        self.view.layoutIfNeeded()
        self.personalInfoHeight.constant = CGFloat(self.tbPersonalInfo.contentSize.height)
        self.btnGeneralInfo.setTitleColor(UIColor.black, for: .normal)
        self.btnProfessionalInfo.setTitleColor(UIColor.darkGray, for: .normal)
        self.btnLicense.setTitleColor(UIColor.darkGray, for: .normal)
    }
    
    @IBAction func btnProfessionalInfoClicked(_ sender: Any)
    {
        self.tbPersonalInfo.tag = 2
        self.tbPersonalInfo.reloadData()
        self.tbPersonalInfo.layoutIfNeeded()
        self.view.layoutIfNeeded()
        self.personalInfoHeight.constant = CGFloat(self.tbPersonalInfo.contentSize.height)
        self.btnGeneralInfo.setTitleColor(UIColor.darkGray, for: .normal)
        self.btnProfessionalInfo.setTitleColor(UIColor.black, for: .normal)
        self.btnLicense.setTitleColor(UIColor.darkGray, for: .normal)
    }
    
    @IBAction func btnLicenseClicked(_ sender: Any)
    {
        self.tbPersonalInfo.tag = 3
        self.tbPersonalInfo.reloadData()
        self.tbPersonalInfo.layoutIfNeeded()
        self.view.layoutIfNeeded()
        self.personalInfoHeight.constant = CGFloat(self.tbPersonalInfo.contentSize.height)
        self.btnGeneralInfo.setTitleColor(UIColor.darkGray, for: .normal)
        self.btnProfessionalInfo.setTitleColor(UIColor.darkGray, for: .normal)
        self.btnLicense.setTitleColor(UIColor.black, for: .normal)
    }
}

// MARK: - Tableview Method

extension DoctorProfileViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if self.tbPersonalInfo.tag == 1 {
            return 3
        } else if self.tbPersonalInfo.tag == 2 {
            return 5
        } else {
            return 11
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if self.tbPersonalInfo.tag == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DoctorPersonalInfoCell", for: indexPath) as! DoctorPersonalInfoCell
            
            if indexPath.row == 0 {
                cell.lblTitle.text = "Date of Birth"
                cell.lblData.text = "20/01/1990"
            } else if indexPath.row == 1 {
                cell.lblTitle.text = "Mobile Number"
                cell.lblData.text = "9876543210"
            } else if indexPath.row == 2 {
                cell.lblTitle.text = "FAX Number"
                cell.lblData.text = "9876543210"
            }
            
            return cell
        } else if self.tbPersonalInfo.tag == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DoctorPersonalInfoCell", for: indexPath) as! DoctorPersonalInfoCell
            
            if indexPath.row == 0 {
                cell.lblTitle.text = "Specialty"
                cell.lblData.text = "Cardiologist"
            } else if indexPath.row == 1 {
                cell.lblTitle.text = "Qualification"
                cell.lblData.text = "MD/MBBS/MBCHB"
            } else if indexPath.row == 2 {
                cell.lblTitle.text = "Location"
                cell.lblData.text = "1507 Ball St, Galveston, TX, 77550"
            } else if indexPath.row == 3 {
                cell.lblTitle.text = "Address"
                cell.lblData.text = "Floor 4, Cabin No 23, TX"
            } else if indexPath.row == 4 {
                cell.lblTitle.text = "Total Experience"
                cell.lblData.text = "3 Years"
            }
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LicenseCell", for: indexPath) as! LicenseCell
            
            if indexPath.row == 0 {
                cell.lblCountry.font = UIFont(name: "Muli-Semi-Bold", size: 17)
                cell.lblRegisteringBody.font = UIFont(name: "Muli-Semi-Bold", size: 17)
                cell.lblLicenseNo.font = UIFont(name: "Muli-Semi-Bold", size: 17)
                
                cell.lblCountry.text = "Country"
                cell.lblRegisteringBody.text = "Registering Body"
                cell.lblLicenseNo.text = "License No"
            } else {
                cell.lblCountry.font = UIFont(name: "Muli-Regular", size: 17)
                cell.lblRegisteringBody.font = UIFont(name: "Muli-Regular", size: 17)
                cell.lblLicenseNo.font = UIFont(name: "Muli-Regular", size: 17)
                
                cell.lblCountry.text = "Canada"
                cell.lblRegisteringBody.text = "CPSO (Ontario)"
                cell.lblLicenseNo.text = "1234"
            }
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if self.tbPersonalInfo.tag == 1 {
            return UITableView.automaticDimension
        } else if self.tbPersonalInfo.tag == 2 {
            return UITableView.automaticDimension
        } else {
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - Tableview cell
class DoctorPersonalInfoCell: UITableViewCell {
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblData: UILabel!
}

class LicenseCell: UITableViewCell {
    @IBOutlet weak var lblCountry: UILabel!
    @IBOutlet weak var lblRegisteringBody: UILabel!
    @IBOutlet weak var lblLicenseNo: UILabel!
}
