//
//  UpcomingAppoinmentDetailsViewController.swift
//  TelemedicineApp
//
//  Created by Bhavik Darji on 04/04/22.
//

import UIKit

class UpcomingAppoinmentDetailsViewController: UIViewController {

    // MARK: - Refference outlet and variables
    @IBOutlet weak var btnReschedule: UIButton!
    @IBOutlet weak var btnStart: UIButton!
    
    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.btnReschedule.addShadow(offset: CGSize(width: 1.0, height: 1.0), color: .gray, radius: 5.0, opacity: 0.5)
        self.btnStart.addShadow(offset: CGSize(width: 1.0, height: 1.0), color: .gray, radius: 5.0, opacity: 0.5)
    }
}

// MARK: - IBAction's

extension UpcomingAppoinmentDetailsViewController
{
    @IBAction func btn_Backclick(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnRescheduleclick(_ sender: Any)
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "RescheduleAppoinmentViewController") as! RescheduleAppoinmentViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnStartclick(_ sender: Any)
    {
        let randomInt = Int.random(in: 0..<2)
        
        if randomInt == 0 {
            let vc = storyboard?.instantiateViewController(withIdentifier: "AudioCallViewController") as! AudioCallViewController
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            let vc = storyboard?.instantiateViewController(withIdentifier: "VideoCallViewController") as! VideoCallViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
