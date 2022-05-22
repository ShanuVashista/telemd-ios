//
//  DoctorSettingViewController.swift
//  TelemedicineApp
//
//  Created by My Mac on 09/04/22.
//

import UIKit

class DoctorSettingViewController: UIViewController {
    
    @IBOutlet weak var tbSetting: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension DoctorSettingViewController
{
    @IBAction func btnBackClicked(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnLogoutClicked(_ sender: Any)
    {
    
    }
}

// MARK: - Tableview Method

extension DoctorSettingViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DoctorSettingCell\(indexPath.row + 1)", for: indexPath) as! DoctorSettingNotificationCell
            
            return cell
        } else if indexPath.row == 8 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DoctorSettingCell\(indexPath.row + 1)", for: indexPath) as! DoctorSettingLogoutCell
            
            cell.btnLogout.addShadow(offset: CGSize(width: 1.0, height: 1.0), color: .gray, radius: 5.0, opacity: 0.5)
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DoctorSettingCell\(indexPath.row + 1)", for: indexPath) as! DoctorSettingCell
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if indexPath.row == 8 {
            return 200
        }
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - Tableview cell
class DoctorSettingCell: UITableViewCell {
    
}

class DoctorSettingNotificationCell: UITableViewCell {
    
}

class DoctorSettingLogoutCell: UITableViewCell {
    @IBOutlet weak var btnLogout: UIButton!
}
