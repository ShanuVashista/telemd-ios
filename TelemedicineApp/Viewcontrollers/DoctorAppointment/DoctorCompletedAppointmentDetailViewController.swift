//
//  DoctorCompletedAppointmentDetailViewController.swift
//  TelemedicineApp
//
//  Created by My Mac on 07/04/22.
//

import UIKit
import Cosmos

class DoctorCompletedAppointmentDetailViewController: UIViewController {

    // MARK: - Refference outlet and variables
    @IBOutlet weak var ivProfile: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblHeight: UILabel!
    @IBOutlet weak var lblWeight: UILabel!
    @IBOutlet weak var lblBMI: UILabel!
    @IBOutlet weak var tbQuesnnarie: UITableView!
    @IBOutlet weak var tbHealthData: UITableView!
    @IBOutlet weak var quesnnarieDataHeight: NSLayoutConstraint!
    @IBOutlet weak var healthDataHeight: NSLayoutConstraint!
    @IBOutlet weak var cvConsultation: UICollectionView!
    @IBOutlet weak var ratingView: CosmosView!
    @IBOutlet weak var tvReview: UITextView!
    @IBOutlet weak var btnSubmit: UIButton!
    
    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.btnSubmit.addShadow(offset: CGSize(width: 1.0, height: 1.0), color: .gray, radius: 5.0, opacity: 0.5)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.tbQuesnnarie.layoutIfNeeded()
        self.view.layoutIfNeeded()
        self.quesnnarieDataHeight.constant = CGFloat(self.tbQuesnnarie.contentSize.height)
        
        self.tbHealthData.layoutIfNeeded()
        self.view.layoutIfNeeded()
        self.healthDataHeight.constant = CGFloat(self.tbHealthData.contentSize.height)
    }
}

// MARK: - IBAction's

extension DoctorCompletedAppointmentDetailViewController
{
    @IBAction func btnBackClicked(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - Tableview Method

extension DoctorCompletedAppointmentDetailViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if tableView == self.tbQuesnnarie {
            return 2
        }
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HealthDataCell", for: indexPath) as! HealthDataCell
        
        if tableView == self.tbQuesnnarie {
            if indexPath.row == 0 {
                cell.lblData.text = "Choosed reason for consultation.\nHead & Neck"
            } else {
                cell.lblData.text = "Is your problem accompanied by new and unfamiliar symptoms such as:\nHeadache, Dizziness, Ear arch"
            }
        } else {
            if indexPath.row == 0 {
                cell.lblData.text = "Medical Condition\nIt is a long established fact that a reader will distracted by the readable content of a page when looking at its layout."
            } else if indexPath.row == 1 {
                cell.lblData.text = "Past Medical Condition\nIt is a long established fact that a reader will distracted by the readable content of a page when looking at its layout."
            } else if indexPath.row == 2 {
                cell.lblData.text = "Allergies\nIt is a long established fact that a reader will distracted by the readable content of a page when looking at its layout."
            } else if indexPath.row == 3 {
                cell.lblData.text = "Medication\nIt is a long established fact that a reader will distracted by the readable content of a page when looking at its layout."
            } else if indexPath.row == 4 {
                cell.lblData.text = "Smoking\nYes"
            } else if indexPath.row == 5 {
                cell.lblData.text = "Alcohol\nYes"
            } else {
                cell.lblData.text = "Marijuana\nYes"
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - Collectionview Method

extension DoctorCompletedAppointmentDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ConsultationCell", for: indexPath) as! ConsultationCell
        return cell
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        print(indexPath.row)
    }
}


// MARK: - Collectionview cell
class ConsultationCell: UICollectionViewCell {
    
    @IBOutlet weak var ivConsultation: UIImageView!
}
