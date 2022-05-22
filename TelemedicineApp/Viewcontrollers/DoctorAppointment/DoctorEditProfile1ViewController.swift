//
//  DoctorEditProfile1ViewController.swift
//  TelemedicineApp
//
//  Created by My Mac on 06/04/22.
//

import UIKit

class DoctorEditProfile1ViewController: UIViewController {

    // MARK: - Refference outlet and variables
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtGender: UITextField!
    @IBOutlet weak var txtDOB: UITextField!
    @IBOutlet weak var txtPhoneNumber: UITextField!
    @IBOutlet weak var txtFaxNumber: UITextField!
    @IBOutlet weak var ivProfile: UIImageView!
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.ivProfile.isUserInteractionEnabled = true
        let tapgesture = UITapGestureRecognizer.init(target: self, action: #selector (ActionSheet_Photos))
        tapgesture.numberOfTapsRequired = 1
        self.ivProfile.addGestureRecognizer(tapgesture)
        
        self.ivProfile.addShadow(offset: CGSize(width: 1.0, height: 1.0), color: .gray, radius: 5.0, opacity: 0.5)
        
        self.txtFirstName.setLeftPaddingPoints(10)
        self.txtLastName.setLeftPaddingPoints(10)
        self.txtGender.setLeftPaddingPoints(10)
        self.txtDOB.setLeftPaddingPoints(10)
        self.txtPhoneNumber.setLeftPaddingPoints(10)
        self.txtFaxNumber.setLeftPaddingPoints(10)

        self.txtFirstName.setRightPaddingPoints(10)
        self.txtLastName.setRightPaddingPoints(10)
        self.txtGender.setRightPaddingPoints(10)
        self.txtDOB.setRightPaddingPoints(10)
        self.txtPhoneNumber.setRightPaddingPoints(10)
        self.txtFaxNumber.setRightPaddingPoints(10)
    }
}

extension DoctorEditProfile1ViewController
{
    @IBAction func btnBackClikced(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnNextClikced(_ sender: Any)
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DoctorEditProfile2ViewController") as! DoctorEditProfile2ViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnCalenderClicked(_ sender: Any)
    {
        RPicker.selectDate(title: "Select Date", didSelectDate: {[weak self] (selectedDate) in
            self?.txtDOB.text = selectedDate.dateStringFromDate("dd MMM, YYYY")
        })
    }
    
    @IBAction func btnGenderClicked(_ sender: Any)
    {
        RPicker.selectOption(dataArray: Array(arrayLiteral: "Male", "Female", "Other")) { (value, index) in
            self.txtGender.text = value
        }
    }
    
    @objc func ActionSheet_Photos()
    {
        let alert = UIAlertController(title: NSLocalizedString("Choose Option", comment: ""), message: "Select any option", preferredStyle: .actionSheet)
        
        let yesButton = UIAlertAction(title: NSLocalizedString("Choose From Gallery", comment: ""), style: .default, handler:
        { action in
            self.fromGallary()
        })
        
        let camerabutton = UIAlertAction(title: NSLocalizedString("Capture Photo", comment: ""), style: .default, handler:
        { action in
            self.camera()
        })
        
        let CancelButton = UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .cancel, handler: { action in
        })
        
        alert.addAction(yesButton)
        alert.addAction(camerabutton)
        alert.addAction(CancelButton)
        
        present(alert, animated: true)
    }
}


// MARK: - Camera & Gallery Functions

extension DoctorEditProfile1ViewController:UINavigationControllerDelegate, UIImagePickerControllerDelegate
{
    func camera()
    {
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self;
        myPickerController.sourceType = .camera
        myPickerController.allowsEditing = true
        self.present(myPickerController, animated: true, completion: nil)
    }
    
    func fromGallary()
    {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        if let image = info[.editedImage] as? UIImage
        {
            self.ivProfile.layer.cornerRadius = 10.0
            self.ivProfile.clipsToBounds = true
            self.ivProfile.contentMode = .scaleToFill
            self.ivProfile.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        picker.dismiss(animated: true, completion: nil)
    }
}
