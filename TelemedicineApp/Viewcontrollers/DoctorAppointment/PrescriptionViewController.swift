//
//  PrescriptionViewController.swift
//  TelemedicineApp
//
//  Created by My Mac on 07/04/22.
//

import UIKit

class PrescriptionViewController: UIViewController {
    
    @IBOutlet weak var tbPrescription: UITableView!
    @IBOutlet weak var lblPatientCheck: UILabel!
    @IBOutlet weak var btnPatientCheck: UIButton!
    @IBOutlet weak var lblLabCheck: UILabel!
    @IBOutlet weak var btnLabCheck: UIButton!
    @IBOutlet weak var btnSubmit: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.btnSubmit.addShadow(offset: CGSize(width: 1.0, height: 1.0), color: .gray, radius: 5.0, opacity: 0.5)
    }
}

extension PrescriptionViewController
{
    @IBAction func btnBackClicked(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnPatientCheckClicked(_ sender: Any)
    {
        if self.lblPatientCheck.backgroundColor == UIColor.white {
            self.lblPatientCheck.backgroundColor = UIColor.systemYellow
            self.btnPatientCheck.setBackgroundImage(UIImage(systemName: "checkmark.square"), for: .normal)
        } else {
            self.lblPatientCheck.backgroundColor = UIColor.white
            self.btnPatientCheck.setBackgroundImage(UIImage(systemName: "square"), for: .normal)
        }
    }
    
    @IBAction func btnLabCheckClicked(_ sender: Any)
    {
        if self.lblLabCheck.backgroundColor == UIColor.white {
            self.lblLabCheck.backgroundColor = UIColor.systemYellow
            self.btnLabCheck.setBackgroundImage(UIImage(systemName: "checkmark.square"), for: .normal)
        } else {
            self.lblLabCheck.backgroundColor = UIColor.white
            self.btnLabCheck.setBackgroundImage(UIImage(systemName: "square"), for: .normal)
        }
    }
    
    @IBAction func btnNextClicked(_ sender: Any)
    {
        
    }
}

// MARK: - Tableview Method

extension PrescriptionViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddMoreCell", for: indexPath) as! AddMoreCell
            
            cell.btnAddMore.addShadow(offset: CGSize(width: 1.0, height: 1.0), color: .gray, radius: 5.0, opacity: 0.5)
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PrescriptionCell", for: indexPath) as! PrescriptionCell
            
            cell.txtName.setLeftPaddingPoints(10)
            cell.txtDose.setLeftPaddingPoints(10)
            cell.txtRoute.setLeftPaddingPoints(10)
            cell.txtDuration.setLeftPaddingPoints(10)
            cell.txtFrequency.setLeftPaddingPoints(10)

            cell.txtName.setRightPaddingPoints(10)
            cell.txtDose.setRightPaddingPoints(10)
            cell.txtRoute.setRightPaddingPoints(10)
            cell.txtDuration.setRightPaddingPoints(10)
            cell.txtFrequency.setRightPaddingPoints(10)
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if indexPath.row == 1 {
            return 70
        } else {
            return 255
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - Tableview cell
class PrescriptionCell: UITableViewCell {
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtDose: UITextField!
    @IBOutlet weak var txtRoute: UITextField!
    @IBOutlet weak var txtFrequency: UITextField!
    @IBOutlet weak var txtDuration: UITextField!
}

class AddMoreCell: UITableViewCell {
    @IBOutlet weak var btnAddMore: UIButton!
}
