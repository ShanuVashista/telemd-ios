//
//  DoctorAvailabilityViewController.swift
//  TelemedicineApp
//
//  Created by My Mac on 06/04/22.
//

import UIKit
import FSCalendar

class DoctorAvailabilityViewController: UIViewController {
    
    @IBOutlet weak var calendarView: FSCalendar!
    @IBOutlet weak var txtOpenTime: UITextField!
    @IBOutlet weak var txtCloseTime: UITextField!
    @IBOutlet weak var tbBreak: UITableView!
    @IBOutlet weak var tbTime: UITableView!
    @IBOutlet weak var breakTableHeight: NSLayoutConstraint!
    @IBOutlet weak var timeTableHeight: NSLayoutConstraint!
    @IBOutlet weak var btnSave: UIButton!
    
    var datesWithEvent = ["2022-04-06", "2022-04-07", "2022-04-08", "2022-04-09"]

    var datesWithMultipleEvents = ["2022-04-19", "2022-04-20", "2022-04-23", "2022-04-24"]

    fileprivate lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.txtOpenTime.setLeftPaddingPoints(10)
        self.txtCloseTime.setLeftPaddingPoints(10)

        self.txtOpenTime.setRightPaddingPoints(10)
        self.txtCloseTime.setRightPaddingPoints(10)
        
        calendarView.delegate = self
        calendarView.dataSource = self
        calendarView.appearance.caseOptions = [.headerUsesUpperCase,.weekdayUsesUpperCase]
        
        self.btnSave.addShadow(offset: CGSize(width: 1.0, height: 1.0), color: .gray, radius: 5.0, opacity: 0.5)
    }
}

extension DoctorAvailabilityViewController
{
    @IBAction func btnSaveClikced(_ sender: Any)
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DoctorBankDetailViewController") as! DoctorBankDetailViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - FSCalendar Method

extension DoctorAvailabilityViewController: FSCalendarDelegate, FSCalendarDataSource
{
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
    }
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {

        let dateString = self.dateFormatter.string(from: date)

        if self.datesWithEvent.contains(dateString) {
            return 1
        }

        if self.datesWithMultipleEvents.contains(dateString) {
            return 1
        }

        return 0
    }
}

// MARK: - Tableview Method

extension DoctorAvailabilityViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if tableView == tbBreak {
            breakTableHeight.constant = 85 * 3
            return 3
        } else {
            timeTableHeight.constant = 90 * 4
            return 4
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if tableView == tbBreak {
            if indexPath.row == 2 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "BreakCell2", for: indexPath) as! BreakCell
                
                cell.txtOpenTime.setLeftPaddingPoints(10)
                cell.txtCloseTime.setLeftPaddingPoints(10)

                cell.txtOpenTime.setRightPaddingPoints(10)
                cell.txtCloseTime.setRightPaddingPoints(10)
                
                return cell
            }
            let cell = tableView.dequeueReusableCell(withIdentifier: "BreakCell1", for: indexPath) as! BreakCell
            
            cell.txtOpenTime.setLeftPaddingPoints(10)
            cell.txtCloseTime.setLeftPaddingPoints(10)

            cell.txtOpenTime.setRightPaddingPoints(10)
            cell.txtCloseTime.setRightPaddingPoints(10)
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TimeCell", for: indexPath) as! TimeCell
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if tableView == tbBreak {
            return 85
        }
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - Tableview cell
class BreakCell: UITableViewCell {
    
    @IBOutlet weak var txtOpenTime: UITextField!
    @IBOutlet weak var txtCloseTime: UITextField!
    @IBOutlet weak var btnClose: UIButton!
}

class TimeCell: UITableViewCell {
    
    @IBOutlet weak var lblDay: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblTime: UILabel!
}
