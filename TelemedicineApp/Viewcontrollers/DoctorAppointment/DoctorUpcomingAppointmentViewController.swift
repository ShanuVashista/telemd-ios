//
//  DoctorUpcomingAppointmentViewController.swift
//  TelemedicineApp
//
//  Created by My Mac on 07/04/22.
//

import UIKit
import KRProgressHUD
import Alamofire

class DoctorUpcomingAppointmentViewController: UIViewController {
    
    @IBOutlet weak var tbUpcomingApt: UITableView!
    
    private var arrAppointment: [Appointment]? = [Appointment]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fetchAppointmentData()
    }
}

// MARK: - IBAction's

extension DoctorUpcomingAppointmentViewController
{
    @IBAction func btnBackClicked(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - Tableview Method

extension DoctorUpcomingAppointmentViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrAppointment?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DoctorAptCell", for: indexPath) as! DoctorAptCell
        
        cell.ivProfile.image = UIImage(named: "TestUser")
        
        cell.lblName.text = (arrAppointment?[indexPath.row].patient?.firstName ?? "") + " " + (arrAppointment?[indexPath.row].patient?.lastName ?? "")
        
        cell.lblTime.text = (arrAppointment?[indexPath.row].appointmentDate ?? "") + " at " + (arrAppointment?[indexPath.row].appointmentTime ?? "")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 140
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = storyboard?.instantiateViewController(withIdentifier: "DoctorUpcomingAppointmentDetailViewController") as! DoctorUpcomingAppointmentDetailViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - Tableview cell
class DoctorAptCell: UITableViewCell {
    @IBOutlet weak var ivProfile: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblHeight: UILabel!
    @IBOutlet weak var lblWeight: UILabel!
    @IBOutlet weak var lblBMI: UILabel!
}

// MARK: - API Methods
extension DoctorUpcomingAppointmentViewController
{
    func fetchAppointmentData() {
        KRProgressHUD.show()
        
        let urlString = APIConstant.BaseURL.path + APIConstant.Endpoints.appointment
        let url = URL.init(string: urlString)

        Alamofire.request(url!, method: .get, parameters: nil, headers: ["Authorization": "Token eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MjUwMTQyOGMwMThlOWQ3M2IxYTcwOTIiLCJpYXQiOjE2NDk0MTUyMDgsImV4cCI6MTY0OTUwMTYwOH0.Ruie4NEkJta0xZnRHnIE1X_h6PK8O8N5Il8K_O-GGtQ"]).responseJSON {
            response in
            
            KRProgressHUD.dismiss()
            
            print("Responseee \(response)")
            
            guard let dataResponse = response.data else {
                print("Response Error")
                return }
            
            do {
                let appointmentData =  try JSONSerialization.jsonObject(with: dataResponse, options: []) as? [String:AnyObject]
                
                print("Dataaaaa \(appointmentData)")
                
                let appointmentList = appointmentData?["data"] as! [[String:AnyObject]]
                
                self.arrAppointment?.removeAll()
                
                for listData in appointmentList {
                    let json = try JSONSerialization.data(withJSONObject:listData)
                    let decodedAppointment = try JSONDecoder().decode(Appointment.self, from: json)
                    
                    self.arrAppointment?.append(decodedAppointment)
                }
                
                self.tbUpcomingApt.reloadData()
            } catch {
                print(error)
            }
        }
    }
}


