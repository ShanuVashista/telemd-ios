//
//  HealthDataListingViewController.swift
//  TelemedicineApp
//
//  Created by Bhavik Darji on 04/04/22.
//

import UIKit

class HealthDataListingViewController: UIViewController {

    // MARK: - Refference outlet and variables

    @IBOutlet weak var tblview: UITableView!
    @IBOutlet weak var btnAddNew: UIButton!

    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tblview.estimatedRowHeight = 100

        self.btnAddNew.addShadow(offset: CGSize(width: 1.0, height: 1.0), color: .gray, radius: 5.0, opacity: 0.5)
    }
}

// MARK: - IBAction's

extension HealthDataListingViewController
{
    @IBAction func btn_Backclick(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btn_Addnewclick(_ sender: Any)
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddHealthDataViewController") as! AddHealthDataViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - Tableview Method

extension HealthDataListingViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = self.tblview.dequeueReusableCell(withIdentifier: "HealthDataListingCell", for: indexPath) as! HealthDataListingCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 110
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print(indexPath.row)
        let vc = storyboard?.instantiateViewController(withIdentifier: "HealthDataDetailsViewController") as! HealthDataDetailsViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


// MARK: - Tableview cell
class HealthDataListingCell: UITableViewCell {
    @IBOutlet weak var imgview: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var bmi: UILabel!
}
