//
//  WaitingRoomViewController.swift
//  TelemedicineApp
//
//  Created by My Mac on 07/04/22.
//

import UIKit

class DoctorWaitingRoomViewController: UIViewController {
    
    @IBOutlet weak var tbWaitingRoom: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - IBAction's

extension DoctorWaitingRoomViewController
{
    @IBAction func btnBackClicked(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - Tableview Method

extension DoctorWaitingRoomViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WaitingRoomCell", for: indexPath) as! WaitingRoomCell
        
        cell.btnStart.addShadow(offset: CGSize(width: 1.0, height: 1.0), color: .gray, radius: 5.0, opacity: 0.5)
        cell.btnViewDetail.addShadow(offset: CGSize(width: 1.0, height: 1.0), color: .gray, radius: 5.0, opacity: 0.5)
        
        if indexPath.row == 0 {
            cell.vwProfile.isHidden = true
            cell.ivLock.isHidden = true
            cell.btnStart.isUserInteractionEnabled = true
            cell.btnViewDetail.isUserInteractionEnabled = true
            cell.btnStart.alpha = 1
            cell.btnViewDetail.alpha = 1
        } else {
            cell.vwProfile.isHidden = false
            cell.ivLock.isHidden = false
            cell.btnStart.isUserInteractionEnabled = false
            cell.btnViewDetail.isUserInteractionEnabled = false
            cell.btnStart.alpha = 0.6
            cell.btnViewDetail.alpha = 0.6
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 155
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - Tableview cell
class WaitingRoomCell: UITableViewCell {
    @IBOutlet weak var ivProfile: UIImageView!
    @IBOutlet weak var vwProfile: UIView!
    @IBOutlet weak var ivLock: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblHeight: UILabel!
    @IBOutlet weak var lblWeight: UILabel!
    @IBOutlet weak var lblBMI: UILabel!
    @IBOutlet weak var btnStart: UIButton!
    @IBOutlet weak var btnViewDetail: UIButton!
}


