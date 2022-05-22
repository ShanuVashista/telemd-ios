//
//  VideoCallViewController.swift
//  TelemedicineApp
//
//  Created by My Mac on 07/04/22.
//

import UIKit

class VideoCallViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - IBAction's

extension VideoCallViewController
{
    @IBAction func btnEndClicked(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnAddNoteClicked(_ sender: Any)
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DoctorAddAppointmentViewController") as! DoctorAddAppointmentViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
