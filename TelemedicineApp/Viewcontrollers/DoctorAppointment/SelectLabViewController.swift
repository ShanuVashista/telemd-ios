//
//  SelectLabViewController.swift
//  TelemedicineApp
//
//  Created by My Mac on 07/04/22.
//

import UIKit

class SelectLabViewController: UIViewController {
    
    @IBOutlet weak var tbSelectLab: UITableView!
    @IBOutlet weak var vwSuccess: UIView!
    @IBOutlet weak var btnOk: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.vwSuccess.isHidden = true
        
        self.btnOk.addShadow(offset: CGSize(width: 1.0, height: 1.0), color: .gray, radius: 5.0, opacity: 0.5)
    }
}

// MARK: - IBAction's

extension SelectLabViewController
{
    @IBAction func btnBackClicked(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnSuccessOkClicked(_ sender: Any)
    {
        self.vwSuccess.isHidden = true
    }
    
    @objc func btnSendClicked(_ sender: UIButton)
    {
        self.vwSuccess.isHidden = false
    }
}

// MARK: - Tableview Method

extension SelectLabViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SelectLabCell", for: indexPath) as! SelectLabCell
        
        cell.btnSend.addTarget(self, action: #selector(btnSendClicked(_:)), for: .touchUpInside)
        cell.btnSend.addShadow(offset: CGSize(width: 1.0, height: 1.0), color: .gray, radius: 5.0, opacity: 0.5)
        
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
class SelectLabCell: UITableViewCell {
    @IBOutlet weak var ivLab: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var btnSend: UIButton!
}
