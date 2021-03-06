//
//  Models.swift
//  AlamofireMapper
//
//  Created by Evgeniy Safin on 09.07.2022.
//

import Foundation
import ObjectMapper

class UsersResponse : NSObject, NSCoding, Mappable{

    var users : [Data]?
    var page : Int?
    var perPage : Int?
    var total : Int?
    var totalPages : Int?


    class func newInstance(map: Map) -> Mappable?{
        return UsersResponse()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        users <- map["data"]
        page <- map["page"]
        perPage <- map["per_page"]
        total <- map["total"]
        totalPages <- map["total_pages"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         users = aDecoder.decodeObject(forKey: "data") as? [Data]
         page = aDecoder.decodeObject(forKey: "page") as? Int
         perPage = aDecoder.decodeObject(forKey: "per_page") as? Int
         total = aDecoder.decodeObject(forKey: "total") as? Int
         totalPages = aDecoder.decodeObject(forKey: "total_pages") as? Int

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if users != nil{
            aCoder.encode(users, forKey: "data")
        }
        if page != nil{
            aCoder.encode(page, forKey: "page")
        }
        if perPage != nil{
            aCoder.encode(perPage, forKey: "per_page")
        }
        if total != nil{
            aCoder.encode(total, forKey: "total")
        }
        if totalPages != nil{
            aCoder.encode(totalPages, forKey: "total_pages")
        }

    }

}

class Data : NSObject, NSCoding, Mappable{

    var avatar : String?
    var email : String?
    var firstName : String?
    var id : Int?
    var lastName : String?


    class func newInstance(map: Map) -> Mappable?{
        return Data()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        avatar <- map["avatar"]
        email <- map["email"]
        firstName <- map["first_name"]
        id <- map["id"]
        lastName <- map["last_name"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         avatar = aDecoder.decodeObject(forKey: "avatar") as? String
         email = aDecoder.decodeObject(forKey: "email") as? String
         firstName = aDecoder.decodeObject(forKey: "first_name") as? String
         id = aDecoder.decodeObject(forKey: "id") as? Int
         lastName = aDecoder.decodeObject(forKey: "last_name") as? String

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if avatar != nil{
            aCoder.encode(avatar, forKey: "avatar")
        }
        if email != nil{
            aCoder.encode(email, forKey: "email")
        }
        if firstName != nil{
            aCoder.encode(firstName, forKey: "first_name")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if lastName != nil{
            aCoder.encode(lastName, forKey: "last_name")
        }

    }

}
