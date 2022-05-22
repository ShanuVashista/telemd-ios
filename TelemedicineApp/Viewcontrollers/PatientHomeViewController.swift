//
//  PatientHomeViewController.swift
//  TelemedicineApp
//
//  Created by Bhavik Darji on 05/04/22.
//

import UIKit

class PatientHomeViewController: UIViewController {

    @IBOutlet weak var btnMyAppointment: UIButton!
    @IBOutlet weak var ivRing: UIImageView!
    @IBOutlet weak var ivCircle: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.btnMyAppointment.titleLabel?.textAlignment = NSTextAlignment.center
        
        self.ivRing.isUserInteractionEnabled = true
        let tapRing = UITapGestureRecognizer(target: self, action: #selector(ringTapped))
        self.ivRing.addGestureRecognizer(tapRing)
        
        self.ivCircle.isUserInteractionEnabled = true
        let tapCircle = UITapGestureRecognizer(target: self, action: #selector(circleTapped))
        self.ivCircle.addGestureRecognizer(tapCircle)
    }
    
    @objc func ringTapped(gr:UITapGestureRecognizer) {
        let loc:CGPoint = gr.location(in: gr.view)
        let color = self.getPixelColorAtPoint(point: loc, sourceView: self.ivRing)
        print("Color Ring \(color)")
        
        let components = color.cgColor.components;
        
        let red = CGFloat(round(1000000 * (components?[0] ?? 0)) / 1000000)
        let green = CGFloat(round(1000000 * (components?[1] ?? 0)) / 1000000)
        let blue = CGFloat(round(1000000 * (components?[2] ?? 0)) / 1000000)
        
        if red == 0.443137 && green == 0.482353 && blue == 0.709804 {
            let vc = storyboard?.instantiateViewController(withIdentifier: "DoctorUpcomingAppointmentViewController") as! DoctorUpcomingAppointmentViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func circleTapped(gr:UITapGestureRecognizer) {
        let loc:CGPoint = gr.location(in: gr.view)
        let color = self.getPixelColorAtPoint(point: loc, sourceView: self.ivCircle)
        print("Color Circle \(color)")
        
        let components = color.cgColor.components;
        
        let red = CGFloat(round(1000000 * (components?[0] ?? 0)) / 1000000)
        let green = CGFloat(round(1000000 * (components?[1] ?? 0)) / 1000000)
        let blue = CGFloat(round(1000000 * (components?[2] ?? 0)) / 1000000)
    }

    func getPixelColorAtPoint(point: CGPoint, sourceView: UIImageView) -> UIColor {
        let pixel = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: 4)
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
        let context = CGContext(data: pixel, width: 1, height: 1, bitsPerComponent: 8, bytesPerRow: 4, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)

        context!.translateBy(x: -point.x, y: -point.y)

        sourceView.layer.render(in: context!)
        let color: UIColor = UIColor(red: CGFloat(pixel[0])/255.0,
                                     green: CGFloat(pixel[1])/255.0,
                                     blue: CGFloat(pixel[2])/255.0,
                                     alpha: CGFloat(pixel[3])/255.0)
        
        return color
    }
}

// MARK: - IBAction's

extension PatientHomeViewController
{
    @IBAction func btnAddNewAppointmentClicked(_ sender: Any)
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SelectYourProfileViewController") as! SelectYourProfileViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnUpcomingAppointmentClicked(_ sender: Any)
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "UpcomingAppoinmentViewController") as! UpcomingAppoinmentViewController
        vc.isfrom = "Upcoming"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnHealthDataClicked(_ sender: Any)
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "HealthDataListingViewController") as! HealthDataListingViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnWaitingRoomClicked(_ sender: Any)
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "WaitingRoomViewController") as! WaitingRoomViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnCompletedAppointmentClicked(_ sender: Any)
    {
         let vc = storyboard?.instantiateViewController(withIdentifier: "UpcomingAppoinmentViewController") as! UpcomingAppoinmentViewController
        vc.isfrom = "Completed"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnFindMDClicked(_ sender: Any)
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DoctorListingViewController") as! DoctorListingViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

