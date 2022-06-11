//
//  LoginManager.swift
//  ProjectO
//
//  Created by Ahmad AlSofi on 11/03/2022.
//

import Foundation
import UIKit
class LoginManager {
    
    class func login() {
        UserDefaults.standard.set(true, forKey: "isLogin")
        
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            delegate.tabbar()
        }
    }
    
    class func logout() {
        UserDefaults.standard.set(false, forKey: "isLogin")
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            delegate.login()
        }
    }
    
    class func isLogin() -> Bool {
        return  UserDefaults.standard.bool(forKey: "isLogin")
    }
    
    class func currentEmail() -> String {
        return UserDefaults.standard.string(forKey: "currentEmail") ?? ""
    }
    
    class func saveCurrentEmail(email: String) {
        print(email)
        UserDefaults.standard.set(email, forKey: "currentEmail")
    }
}


class UserLoginModel: Codable {
    var email: String?
    var password: String?
}

class UserDefaultManager {
    class func login(email: String, password: String) {
        var data = UserDefaultManager.retriveLoginData()
        let model = UserLoginModel()
        model.email = email
        model.password = password
        data.append(model)
        if let encoded = try? JSONEncoder().encode(data) {
             UserDefaults.standard.set(encoded, forKey: "UserLoginModel")
         }
    }
    
    class func retriveLoginData() -> [UserLoginModel] {
        guard let savedPersonData = UserDefaults.standard.object(forKey: "UserLoginModel") as? Data else { return []}
        guard let savedPerson = try? JSONDecoder().decode([UserLoginModel].self, from: savedPersonData) else { return []}
        return savedPerson
    }
    
    class func update(oldEmail: String ,email: String, password: String) {
        var data = UserDefaultManager.retriveLoginData()
        
        var filterData =  data.filter( { $0.email != oldEmail } )
        
        
        print("Filter")
        filterData.forEach { item  in
            print(item.email)
            print(item.password)
        }
        
        let model = UserLoginModel()
        model.email = email
        model.password = password
        
        filterData.append(model)
        
        if let encoded = try? JSONEncoder().encode(filterData) {
             UserDefaults.standard.set(encoded, forKey: "UserLoginModel")
         }
        
        LoginManager.saveCurrentEmail(email: email)
    }
}


class UserSignUpModel: Codable {
    var email: String?
    var password: String?
    var phone: String?
}

class PostDefaultManager {
    
    class func createPost(post: PostModel) {
        var data = PostDefaultManager.retrivePosts()
        data.append(post)
        if let encoded = try? JSONEncoder().encode(data) {
             UserDefaults.standard.set(encoded, forKey: "PostModel")
         }
    }
    
    class func retrivePosts() -> [PostModel] {
        guard let savedPersonData = UserDefaults.standard.object(forKey: "PostModel") as? Data else { return []}
        guard let savedPerson = try? JSONDecoder().decode([PostModel].self, from: savedPersonData) else { return []}
        return savedPerson
    }
}

struct QustionModel: Codable {
    var title: String?
    var body: String?
    var email: String?
    var id: String?
}

class QustionDefaultManager {
    
    class func createPost(post: PostModel) {
        var data = QustionDefaultManager.retriveQustionModel()
        data.append(post)
        if let encoded = try? JSONEncoder().encode(data) {
             UserDefaults.standard.set(encoded, forKey: "QustionModel")
         }
    }
    
    class func retriveQustionModel() -> [PostModel] {
        guard let savedPersonData = UserDefaults.standard.object(forKey: "QustionModel") as? Data else { return []}
        guard let savedPerson = try? JSONDecoder().decode([PostModel].self, from: savedPersonData) else { return []}
        return savedPerson
    }
}

struct CommentModel: Codable {
    var postID: String?
    var text: String?
    var date: Date?
}

class CommentDefaultManager {
    
    class func create(post: CommentModel) {
        var data = CommentDefaultManager.retrive()
        data.append(post)
        if let encoded = try? JSONEncoder().encode(data) {
             UserDefaults.standard.set(encoded, forKey: "CommentModel")
         }
    }
    
    class func retrive() -> [CommentModel] {
        guard let savedPersonData = UserDefaults.standard.object(forKey: "CommentModel") as? Data else { return []}
        guard let savedPerson = try? JSONDecoder().decode([CommentModel].self, from: savedPersonData) else { return []}
        return savedPerson
    }
}

struct FavModel: Codable {
    var postID: String?
    var email: String?
}

class FavDefaultManager {
    
    class func create(post: FavModel) {
        let data = retrive()
        var filterData =  data.filter( { $0.postID != post.postID } )
        filterData.append(post)
        if let encoded = try? JSONEncoder().encode(filterData) {
             UserDefaults.standard.set(encoded, forKey: "FavModel")
         }
    }
    
    
    class func remove(post: FavModel) {
        let data = retrive()
        let filterData =  data.filter( { $0.postID != post.postID } )
        if let encoded = try? JSONEncoder().encode(filterData) {
             UserDefaults.standard.set(encoded, forKey: "FavModel")
         }
    }
    
    class func retrive() -> [FavModel] {
        guard let savedPersonData = UserDefaults.standard.object(forKey: "FavModel") as? Data else { return []}
        guard let savedPerson = try? JSONDecoder().decode([FavModel].self, from: savedPersonData) else { return []}
        return savedPerson
    }
}

struct ImagesModel: Codable {
    var image: String?
}
class ImagesDefaultManager {
    
    class func create(post: ImagesModel) {
        var data = retrive()
        data.append(post)
        if let encoded = try? JSONEncoder().encode(data) {
             UserDefaults.standard.set(encoded, forKey: "ImagesModel")
         }
    }

    class func retrive() -> [ImagesModel] {
        guard let savedPersonData = UserDefaults.standard.object(forKey: "ImagesModel") as? Data else { return []}
        guard let savedPerson = try? JSONDecoder().decode([ImagesModel].self, from: savedPersonData) else { return []}
        return savedPerson
    }
}
