//
//  AppoinmentBookedPopupViewController.swift
//  TelemedicineApp
//
//  Created by Bhavik Darji on 01/04/22.
//

import UIKit

class AppoinmentBookedPopupViewController: UIViewController {

    // MARK: - Refference outlet and variables
    @IBOutlet weak var btnOk: UIButton!

    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

        self.btnOk.addShadow(offset: CGSize(width: 1.0, height: 1.0), color: .gray, radius: 5.0, opacity: 0.5)
    }
}

// MARK: - IBAction's

extension AppoinmentBookedPopupViewController
{
    @IBAction func btn_Hiddenclick(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btn_Okayclick(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
    }
}
