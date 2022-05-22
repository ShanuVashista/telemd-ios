//
//  DoctorPaymentMethodsViewController.swift
//  TelemedicineApp
//
//  Created by My Mac on 09/04/22.
//

import UIKit

class DoctorPaymentMethodsViewController: UIViewController {
    
    @IBOutlet weak var tbPaymentMethod: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension DoctorPaymentMethodsViewController
{
    @IBAction func btnBackClicked(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - Tableview Method

extension DoctorPaymentMethodsViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DoctorPaymentMethodCell", for: indexPath) as! DoctorPaymentMethodCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - Tableview cell
class DoctorPaymentMethodCell: UITableViewCell {
    @IBOutlet weak var btnCheck: UIButton!
    @IBOutlet weak var lblBankName: UILabel!
    @IBOutlet weak var lblAccountNo: UILabel!
}
