//
//  ReplyModel.swift
//  ProjectO
//
//  Created by Ahmad AlSofi on 11/03/2022.
//

import Foundation

struct ReplyModel {
    
    var body: String?
    var date: Date?
}

func replyModelDataSource() -> [ReplyModel] {
    
    let postModelDataSource: [ReplyModel] = [
        
        ReplyModel(body: "I think people just aren’t really going to see that many movies in the theater anymore, except for the Disney/Marvel sequels, so competition is stiff.", date: PostModel.createDate(month: 3, day: 23, hour: 12, min: 12)),
        
        ReplyModel(body: "I don’t know about uncharted. It’s not a critical success certainly. But the rotten tomatoes for audience is 90% current worldwide gross is $148,135,478 so it’s paid back the $120 million budget. Not a blockbuster but decently popular.", date: PostModel.createDate(month: 2, day: 7, hour: 2, min: 32)),
        
        ReplyModel(body: "I liked the movie. I went to see it with my 17 yr old and wife.", date: PostModel.createDate(month: 4, day: 2, hour: 10, min: 5))
    ]
    
    return postModelDataSource.sorted { $0.date! > $1.date! }
}





