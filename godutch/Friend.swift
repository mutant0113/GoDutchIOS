//
//  Friend.swift
//  godutch
//
//  Created by 方又生 on 2017/10/21.
//  Copyright © 2017年 方又生. All rights reserved.
//

import UIKit

class Friend {
    var uid: String
    var name: String
    var photoUrl: String
    var debt: Double
    
    convenience init(snapShot: NSDictionary?) {
        let uid = snapShot?["uid"] as? String ?? ""
        let name = snapShot?["name"] as? String ?? ""
        let photoUrl = snapShot?["photoUrl"] as? String ?? ""
        let debt = snapShot?["debt"] as? Double ?? 0.0
        self.init(uid: uid, name: name, photoUrl: photoUrl, debt: debt)
    }
    
    init(uid: String, name: String, photoUrl: String, debt: Double) {
        self.uid = uid
        self.name = name
        self.photoUrl = photoUrl
        self.debt = debt
    }
    
    func toDictionary() -> [String: Any] {
        var dictionary = [String: Any]()
        dictionary["uid"] = self.uid
        dictionary["name"] = self.name
        dictionary["photoUrl"] = self.photoUrl
        dictionary["debt"] = self.debt
        return dictionary
    }
}
