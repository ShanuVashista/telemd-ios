//
//  DoctorPendingRequestsViewController.swift
//  TelemedicineApp
//
//  Created by My Mac on 07/04/22.
//

import UIKit

class DoctorPendingRequestsViewController: UIViewController {
    
    @IBOutlet weak var tbPendingRequest: UITableView!
    @IBOutlet weak var vwReason: UIView!
    @IBOutlet weak var btnOk: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.vwReason.isHidden = true
        
        self.btnOk.addShadow(offset: CGSize(width: 1.0, height: 1.0), color: .gray, radius: 5.0, opacity: 0.5)
    }
}

// MARK: - IBAction's

extension DoctorPendingRequestsViewController
{
    @IBAction func btnBackClicked(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnReasonCloseClicked(_ sender: Any)
    {
        self.vwReason.isHidden = true
    }
    
    @IBAction func btnReasonOkClicked(_ sender: Any)
    {
        self.vwReason.isHidden = true
    }
    
    @objc func btnRejectClicked(_ sender: UIButton)
    {
        self.vwReason.isHidden = false
    }
}

// MARK: - Tableview Method

extension DoctorPendingRequestsViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PendingRequestsCell", for: indexPath) as! PendingRequestsCell
        
        cell.btnAccept.addShadow(offset: CGSize(width: 1.0, height: 1.0), color: .gray, radius: 5.0, opacity: 0.5)
        cell.btnReject.addShadow(offset: CGSize(width: 1.0, height: 1.0), color: .gray, radius: 5.0, opacity: 0.5)
        
        cell.btnReject.addTarget(self, action: #selector(btnRejectClicked(_:)), for: .touchUpInside)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 140
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - Tableview cell
class PendingRequestsCell: UITableViewCell {
    @IBOutlet weak var ivProfile: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var btnAccept: UIButton!
    @IBOutlet weak var btnReject: UIButton!
}


