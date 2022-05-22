//
//  AppointmentResponse.swift
//  TelemedicineApp
//
//  Created by My Mac on 06/04/22.
//

import Foundation
// MARK: - TripReportsList
struct Appointment: Codable {
    var appointmentDate: String?
    var appointmentTime: String?
    var appointmentType: String?
    var createdAt: String?
    var doctor: Doctor?
    var doctorId: String?
    var id: String?
    var patient: Patient?
    var patientId: String?
    var updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case appointmentDate = "appointmentDate"
        case appointmentTime = "appointmentTime"
        case appointmentType = "appointmentType"
        case createdAt = "createdAt"
        case doctor = "doctor"
        case doctorId = "doctorId"
        case id = "id"
        case patient = "patient"
        case patientId = "patientId"
        case updatedAt = "updatedAt"
    }
}

// MARK: - Result
struct Doctor: Codable {
    var DOB: String?
    var id: String?
    var address: String?
    var comment: String?
    var createdAt: String?
    var email: String?
    var firstName: String?
    var gender: String?
    var isEmailVerified: Bool?
    var isPhoneVerified: Bool?
    var lastName: String?
    var mobileNo: String?
    var role_id: String?
    var status: String?
    var statusUpdatedAt: String?
    var updatedAt: String?
    
    enum CodingKeys: String, CodingKey {
        case DOB = "DOB"
        case id = "id"
        case address = "address"
        case comment = "comment"
        case createdAt = "createdAt"
        case email = "email"
        case firstName = "firstName"
        case gender = "gender"
        case isEmailVerified = "isEmailVerified"
        case isPhoneVerified = "isPhoneVerified"
        case lastName = "lastName"
        case mobileNo = "mobileNo"
        case role_id = "role_id"
        case status = "status"
        case statusUpdatedAt = "statusUpdatedAt"
        case updatedAt = "updatedAt"
    }
}

// MARK: - Forecast
struct Patient: Codable {
    var DOB: String?
    var id: String?
    var address: String?
    var comment: String?
    var createdAt: String?
    var email: String?
    var firstName: String?
    var gender: String?
    var isEmailVerified: Bool?
    var isPhoneVerified: Bool?
    var lastName: String?
    var mobileNo: String?
    var role_id: String?
    var status: String?
    var statusUpdatedAt: String?
    var updatedAt: String?
    
    enum CodingKeys: String, CodingKey {
        case DOB = "DOB"
        case id = "id"
        case address = "address"
        case comment = "comment"
        case createdAt = "createdAt"
        case email = "email"
        case firstName = "firstName"
        case gender = "gender"
        case isEmailVerified = "isEmailVerified"
        case isPhoneVerified = "isPhoneVerified"
        case lastName = "lastName"
        case mobileNo = "mobileNo"
        case role_id = "role_id"
        case status = "status"
        case statusUpdatedAt = "statusUpdatedAt"
        case updatedAt = "updatedAt"
    }
}
