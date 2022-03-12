//
//  MessageDataSource.swift
//  ProjectO
//
//  Created by Ahmad AlSofi on 04/03/2022.
//

import Foundation
class MessageDataSource  {
    
    enum TypeMessage {
        case revice
        case send
    }
    
    var message: String
    var type: TypeMessage
    
    init(message: String,type: TypeMessage) {
        self.message = message
        self.type = type
    }
    
    static func data() -> [MessageDataSource] {
        return [
            MessageDataSource(message: "Hello! I can't find a document for the dsdsHello! I can't find a document for the dsdsHello! I can't find a document for the dsdsHello! I can't find a document for the dsdsHello! I can't find a document for the dsdsHello! I can't fin", type: .revice),
            MessageDataSource(message: "Hello!, I think maybe lll.//dkdkkdkdkdkdkd", type: .send),
            MessageDataSource(message: "Hello! I can't find a document for the dsds", type: .revice),
            MessageDataSource(message: "Hello!, I think maybe lll.//dkdkkdkdkdkdkd", type: .send),
            MessageDataSource(message: "Hello!, I think maybe ", type: .send),
            MessageDataSource(message: "Hello! I can't find a document for the dsds", type: .revice),
            MessageDataSource(message: "Hello!, I think maybe lll.//dkdkkdkdkdkdkd", type: .send),
            MessageDataSource(message: "Hello! I can't find a document for the dsds", type: .revice),
            MessageDataSource(message: "Hello!, I think maybe lll.//dkdkkdkdkdkdkd", type: .send)
        ]
    }
}
