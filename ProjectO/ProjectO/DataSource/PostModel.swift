//
//  PostModel.swift
//  ProjectO
//
//  Created by Ahmad AlSofi on 11/03/2022.
//

import Foundation
struct PostModel {
    var title: String?
    var body: String?
    var date: Date?
    
    var views: String?
    var isFav: Bool?
    
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

func postModelDataSource() -> [PostModel] {
    
    
    var postModelDataSource: [PostModel] = [
        PostModel(title: "What fact about an actress still surprises people today?", body: "The fact that actress Bryce Dallas Howard was pregnant while filming Spider-Man 3 in 2007 came as a complete surprise.", date: PostModel.createDate(month: 3, day: 11, hour: 2, min: 24), views: "120", isFav: true),
        
        
        PostModel(title: "What is the Ripple currency?", body: "Ripple is a system built to process a significant number of money transfers and currency exchanges. ", date: PostModel.createDate(month: 2, day: 22, hour: 10, min: 11), views: "240", isFav: false),
        
        
        PostModel(title: "What method of execution in history makes your hair stand on end?", body: "The Brazen Bull. It was allegedly used as a method of execution in ancient Greece.", date: PostModel.createDate(month: 1, day: 2, hour: 5, min: 32), views: "643", isFav: false),
        
        
        PostModel(title: "Why is Java considered a hard programming language?", body: "Actually, compared to other languages, learning Java is about middling difficulty. Pascal used to be used for teaching — it was designed to be a pedagogical language — and it was easy to learn. ", date: PostModel.createDate(month: 2, day: 3, hour: 2, min: 21), views: "50", isFav: false),
        
        
        PostModel(title: "Can Google go bankrupt?", body: "For a company to go bankrupt, all 3 of the following need to happen: 1. The company needs to be making a loss. Google’s making around US$20bn p/a of profit. 2.", date: PostModel.createDate(month: 2, day: 12, hour: 12, min: 0), views: "5", isFav: false),
        
        PostModel(title: "What happened to actor Tom Holland? Is it normal to make a lot of movies?", body: "Tom Holland is not having success in his latest projects, with the exception of the Spider-Man movies… But I believe this is something common in the world of movies.", date: PostModel.createDate(month: 3, day: 22, hour: 2, min: 54), views: "23", isFav: false)
    ]
    
    return postModelDataSource.sorted { $0.date! > $1.date! }
}


func qAndAModelDataSource() -> [PostModel] {
    
    
    var postModelDataSource: [PostModel] = [
        PostModel(title: "What fact about an actress still surprises people today?", body: "The fact that actress Bryce Dallas Howard was pregnant while filming Spider-Man 3 in 2007 came as a complete surprise.", date: PostModel.createDate(month: 3, day: 11, hour: 2, min: 24), views: "120", isFav: true),
        
        
        PostModel(title: "What is the Ripple currency?", body: "Ripple is a system built to process a significant number of money transfers and currency exchanges. ", date: PostModel.createDate(month: 2, day: 22, hour: 10, min: 11), views: "240", isFav: false),
        
        
        PostModel(title: "What method of execution in history makes your hair stand on end?", body: "The Brazen Bull. It was allegedly used as a method of execution in ancient Greece.", date: PostModel.createDate(month: 1, day: 2, hour: 5, min: 32), views: "643", isFav: false),
        
        
        PostModel(title: "Why is Java considered a hard programming language?", body: "Actually, compared to other languages, learning Java is about middling difficulty. Pascal used to be used for teaching — it was designed to be a pedagogical language — and it was easy to learn. ", date: PostModel.createDate(month: 2, day: 3, hour: 2, min: 21), views: "50", isFav: false),
        
        
        PostModel(title: "Can Google go bankrupt?", body: "For a company to go bankrupt, all 3 of the following need to happen: 1. The company needs to be making a loss. Google’s making around US$20bn p/a of profit. 2.", date: PostModel.createDate(month: 2, day: 12, hour: 12, min: 0), views: "5", isFav: false),
        
        PostModel(title: "What happened to actor Tom Holland? Is it normal to make a lot of movies?", body: "Tom Holland is not having success in his latest projects, with the exception of the Spider-Man movies… But I believe this is something common in the world of movies.", date: PostModel.createDate(month: 3, day: 22, hour: 2, min: 54), views: "23", isFav: false)
    ]
    
    return postModelDataSource.sorted { Int($0.views!)! > Int($1.views!)! }
}



