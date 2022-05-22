//
//  DoctorUpcomingAppointmentViewController.swift
//  TelemedicineApp
//
//  Created by My Mac on 07/04/22.
//

import UIKit

class DoctorCompletedAppointmentViewController: UIViewController {
    
    @IBOutlet weak var tbCompletedApt: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - IBAction's

extension DoctorCompletedAppointmentViewController
{
    @IBAction func btnBackClicked(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - Tableview Method

extension DoctorCompletedAppointmentViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DoctorAptCell", for: indexPath) as! DoctorAptCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 140
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = storyboard?.instantiateViewController(withIdentifier: "DoctorCompletedAppointmentDetailViewController") as! DoctorCompletedAppointmentDetailViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


