//
//  BodyViewController.swift
//  TelemedicineApp
//
//  Created by Bhavik Darji on 01/04/22.
//

import UIKit

class BodyViewController: UIViewController {

    // MARK: - Refference outlet and variables
    @IBOutlet weak var tblview: UITableView!
    @IBOutlet weak var btnOther: UIButton!

    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.btnOther.addShadow(offset: CGSize(width: 1.0, height: 1.0), color: .gray, radius: 5.0, opacity: 0.5)
    }
}


// MARK: - IBAction's

extension BodyViewController
{
    @IBAction func btn_Backclick(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btn_Otherclick(_ sender: Any)
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "BodyReasonViewController") as! BodyReasonViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
