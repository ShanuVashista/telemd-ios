//
//  DoctorCreateProfile2ViewController.swift
//  TelemedicineApp
//
//  Created by My Mac on 06/04/22.
//

import UIKit

class DoctorCreateProfile2ViewController: UIViewController {
    
    // MARK: - Refference outlet and variables
    @IBOutlet weak var txtSpecialty: UITextField!
    @IBOutlet weak var txtQualification: UITextField!
    @IBOutlet weak var txtTotalExperience: UITextField!
    @IBOutlet weak var txtLocation: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtPostCode: UITextField!
    @IBOutlet weak var txtState: UITextField!
    @IBOutlet weak var txtCountry: UITextField!
    @IBOutlet weak var tbLicense: UITableView!
    @IBOutlet weak var licenseHeight: NSLayoutConstraint!
    @IBOutlet weak var btnAddMore: UIButton!
    @IBOutlet weak var btnSubmit: UIButton!
    
    var email = ""
    var password = ""
    var firstname = ""
    var lastname = ""
    var gender = ""
    var DOB = ""
    var phoneNumber = ""
    var profileImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.txtSpecialty.setLeftPaddingPoints(10)
        self.txtQualification.setLeftPaddingPoints(10)
        self.txtTotalExperience.setLeftPaddingPoints(10)
        self.txtLocation.setLeftPaddingPoints(10)
        self.txtAddress.setLeftPaddingPoints(10)
        self.txtCity.setLeftPaddingPoints(10)
        self.txtPostCode.setLeftPaddingPoints(10)
        self.txtState.setLeftPaddingPoints(10)
        self.txtCountry.setLeftPaddingPoints(10)

        self.txtSpecialty.setRightPaddingPoints(10)
        self.txtQualification.setRightPaddingPoints(10)
        self.txtTotalExperience.setRightPaddingPoints(10)
        self.txtLocation.setRightPaddingPoints(10)
        self.txtAddress.setRightPaddingPoints(10)
        self.txtCity.setRightPaddingPoints(10)
        self.txtPostCode.setRightPaddingPoints(10)
        self.txtState.setRightPaddingPoints(10)
        self.txtCountry.setRightPaddingPoints(10)
        
        self.btnAddMore.addShadow(offset: CGSize(width: 1.0, height: 1.0), color: .gray, radius: 5.0, opacity: 0.5)
        self.btnSubmit.addShadow(offset: CGSize(width: 1.0, height: 1.0), color: .gray, radius: 5.0, opacity: 0.5)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.tbLicense.layoutIfNeeded()
        self.view.layoutIfNeeded()
        self.licenseHeight.constant = CGFloat(self.tbLicense.contentSize.height)
    }
}

extension DoctorCreateProfile2ViewController
{
    @IBAction func btnBackClikced(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnSpecialtyClicked(_ sender: Any)
    {
        RPicker.selectOption(dataArray: Array(arrayLiteral: "Surgery", "Pediatrics", "Neurology")) { (value, index) in
            self.txtSpecialty.text = value
        }
    }
    
    @IBAction func btnQualificationClicked(_ sender: Any)
    {
        RPicker.selectOption(dataArray: Array(arrayLiteral: "MBBS", "BDS", "BHMS")) { (value, index) in
            self.txtQualification.text = value
        }
    }
    
    @IBAction func btnStateClicked(_ sender: Any)
    {
        RPicker.selectOption(dataArray: Array(arrayLiteral: "Gujarat", "Punjab", "Maharashtra")) { (value, index) in
            self.txtState.text = value
        }
    }
    
    @IBAction func btnCountryClicked(_ sender: Any)
    {
        RPicker.selectOption(dataArray: Array(arrayLiteral: "India", "US", "UK")) { (value, index) in
            self.txtCountry.text = value
        }
    }
    
    @objc func btnLicenseCountryClicked(_ sender: Any)
    {
        RPicker.selectOption(dataArray: Array(arrayLiteral: "India", "US", "UK")) { (value, index) in
            
        }
    }
        
    @objc func btnLicensingAuthorityClicked(_ sender: Any)
    {
        RPicker.selectOption(dataArray: Array(arrayLiteral: "Licensing Authority 1", "Licensing Authority 2", "Licensing Authority 3")) { (value, index) in
            
        }
    }
    
    @IBAction func btnAddMoreCliked(_ sender: Any)
    {
        
    }
    
    @IBAction func btnSubmitClicked(_ sender: Any)
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DoctorAvailabilityViewController") as! DoctorAvailabilityViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - Tableview Method

extension DoctorCreateProfile2ViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DoctorLicenseCell", for: indexPath) as! DoctorLicenseCell
        
        cell.txtLicenceCountry.setLeftPaddingPoints(10)
        cell.txtLicensingAuthority.setLeftPaddingPoints(10)
        cell.txtLicensingNo.setLeftPaddingPoints(10)
        
        cell.txtLicenceCountry.setRightPaddingPoints(10)
        cell.txtLicensingAuthority.setRightPaddingPoints(10)
        cell.txtLicensingNo.setRightPaddingPoints(10)
        
        cell.btnLicenceCountry.addTarget(self, action: #selector(btnLicenseCountryClicked(_:)), for: .touchUpInside)
        cell.btnLicensingAuthority.addTarget(self, action: #selector(btnLicensingAuthorityClicked(_:)), for: .touchUpInside)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 210
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - Tableview cell
class DoctorLicenseCell: UITableViewCell {
    @IBOutlet weak var btnLicenceCountry: UIButton!
    @IBOutlet weak var btnLicensingAuthority: UIButton!
    
    @IBOutlet weak var txtLicenceCountry: UITextField!
    @IBOutlet weak var txtLicensingAuthority: UITextField!
    @IBOutlet weak var txtLicensingNo: UITextField!
}

