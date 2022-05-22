//
//  ClinicalNoteViewController.swift
//  TelemedicineApp
//
//  Created by My Mac on 07/04/22.
//

import UIKit

class ClinicalNoteViewController: UIViewController {
    
    // MARK: - Refference outlet and variables
    @IBOutlet weak var tbQuesnnarie: UITableView!
    @IBOutlet weak var quesnnarieDataHeight: NSLayoutConstraint!
    @IBOutlet weak var tvSubjective: UITextView!
    @IBOutlet weak var tvObjective: UITextView!
    @IBOutlet weak var tvAssesment: UITextView!
    @IBOutlet weak var tvPlan: UITextView!
    @IBOutlet weak var btnSubmit: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.btnSubmit.addShadow(offset: CGSize(width: 1.0, height: 1.0), color: .gray, radius: 5.0, opacity: 0.5)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.tvSubjective.layer.borderWidth = 1
        self.tvSubjective.layer.cornerRadius = 5
        self.tvSubjective.layer.borderColor = UIColor.lightGray.cgColor
        
        self.tvObjective.layer.borderWidth = 1
        self.tvObjective.layer.cornerRadius = 5
        self.tvObjective.layer.borderColor = UIColor.lightGray.cgColor
        
        self.tvAssesment.layer.borderWidth = 1
        self.tvAssesment.layer.cornerRadius = 5
        self.tvAssesment.layer.borderColor = UIColor.lightGray.cgColor
        
        self.tvPlan.layer.borderWidth = 1
        self.tvPlan.layer.cornerRadius = 5
        self.tvPlan.layer.borderColor = UIColor.lightGray.cgColor
        
        self.tbQuesnnarie.layoutIfNeeded()
        self.view.layoutIfNeeded()
        self.quesnnarieDataHeight.constant = CGFloat(self.tbQuesnnarie.contentSize.height)
    }
}

extension ClinicalNoteViewController
{
    @IBAction func btnBackClicked(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
}

extension ClinicalNoteViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HealthDataCell", for: indexPath) as! HealthDataCell
        
        if indexPath.row == 0 {
            cell.lblData.text = "Choosed reason for consultation.\nHead & Neck"
        } else {
            cell.lblData.text = "Is your problem accompanied by new and unfamiliar symptoms such as:\nHeadache, Dizziness, Ear arch"
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
