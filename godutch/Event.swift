//
//  Event.swift
//  godutch
//
//  Created by 方又生 on 2017/10/21.
//  Copyright © 2017年 方又生. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class Event {
    var key: String = ""
    //    var type: TYPE = TYPE.FOOD
    var title: String = ""
    var photoUrl: String = ""
    var subtotal: Double = 0.0
    var tax: Double = 0.0
    var total: Double = 0.0
    //    var exchangeRate: ExchangeRate?
    var friendsPaid: [Friend] = [Friend]()
    var friendsShared: [Friend] = [Friend]()
    
    convenience init(snapShot: NSDictionary) {
        let title = snapShot["title"] as! String
        let photoUrl = snapShot["photoUrl"] as! String
        let subtotal = snapShot["subtotal"] as! Double
        let tax = snapShot["tax"] as! Double
        let total = snapShot["total"] as! Double
        //        let friendsPaid = snapShotValue["friendsPaid"] as! [Friend:Any]
        //        let friendsShared = snapShotValue["friendsShared"] as! [Friend:Any]
        let friendsPaid = [Friend]()
        let friendsShared = [Friend]()
        self.init(title: title, photoUrl: photoUrl, subtotal: subtotal, tax: tax, total: total, friendsPaid: friendsPaid, friendsShared: friendsShared)
    }
    
    init(title: String, photoUrl: String, subtotal: Double, tax: Double, total: Double,
         friendsPaid: [Friend], friendsShared: [Friend]) {
        self.title = title
        self.photoUrl = photoUrl
        self.subtotal = subtotal
        self.tax = tax
        self.total = total
        self.friendsPaid = friendsPaid
        self.friendsShared = friendsShared
    }
}
