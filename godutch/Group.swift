//
//  Group.swift
//  godutch
//
//  Created by 方又生 on 2017/10/20.
//  Copyright © 2017年 方又生. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class Group {
    
    var title: String
    var photoUrl: String?
    var subtotal: Double
    var friendsUid: [String]
    var key: String?
    //    val timestamp: HashMap<String, Any> = hashMapOf()
    //    var timestampCreated: Long = 0
    //    @Exclude
    //    get() = timestamp["timestamp"] as Long? ?: 0
    
    convenience init(snapShot: NSDictionary) {
        let title = snapShot["title"] as! String
        let photoUrl = snapShot["photoUrl"] as! String
        let subtotal = snapShot["subtotal"] as! Double
        let friendsUid = [String]()
        self.init(title: title, photoUrl: photoUrl, subtotal: subtotal, friendsUid: friendsUid)
    }
    
    init(title: String, photoUrl: String, subtotal: Double, friendsUid: [String]) {
        self.title = title
        self.photoUrl = photoUrl
        self.subtotal = subtotal
        self.friendsUid = friendsUid
    }
}
