//
//  PostModel.swift
//  ProjectO
//
//  Created by Ahmad AlSofi on 11/03/2022.
//

import Foundation
struct PostModel: Codable {
    var title: String?
    var body: String?
    var showAge: Bool?
    var permanent: Bool?
    var category: String?
    var email: String?
    var id: String?
    
    var date: Date?
    
    var views: String?
    var isFav: Bool?
    
    var images: [String]
    
    
    static func createDate(month: Int, day: Int, hour: Int,min: Int) -> Date {
        // Specify date components
        var dateComponents = DateComponents()
        dateComponents.year = 2022
        dateComponents.month = month
        dateComponents.day = day
        dateComponents.timeZone = TimeZone(abbreviation: "JST") // Japan Standard Time
        dateComponents.hour = hour
        dateComponents.minute = min
        
        // Create date from components
        let userCalendar = Calendar(identifier: .gregorian) // since the components above (like year 1980) are for Gregorian
        let someDateTime = userCalendar.date(from: dateComponents)
        return someDateTime!
    }
}
