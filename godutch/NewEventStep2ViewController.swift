//
//  NewEventStep2ViewController.swift
//  godutch
//
//  Created by 方又生 on 2017/10/21.
//  Copyright © 2017年 方又生. All rights reserved.
//

import UIKit
import os.log
import FirebaseAuth
import FirebaseDatabase

class NewEventStep2ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var mTableViewPaid: UITableView!
    @IBOutlet weak var mTableViewShared: UITableView!
    
    var mGroupKey: String = ""
    var mEvent: Event?
    var mRef: DatabaseReference = Database.database().reference()
    var mFriends = [Friend]()
    var mAllUsers = [Friend]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mTableViewPaid.dataSource = self
        mTableViewPaid.delegate = self
        mTableViewPaid.rowHeight = 100
        mTableViewShared.dataSource = self
        mTableViewShared.delegate = self
        mTableViewShared.rowHeight = 100
        loadFriends()
    }
    
    private func loadFriends() {
        let me = Auth.auth().currentUser
        mRef.child("friends").child(me!.uid).queryOrdered(byChild: "name").observeSingleEvent(of: .value, with: { snapShot in
            for child in snapShot.children.allObjects as! [DataSnapshot] {
                let value = child.value as! NSDictionary
                let friend = Friend(snapShot: value)
                self.mEvent?.friendsShared.append(friend)
            }
            
            let friendMe = Friend(uid: me!.uid, name: me!.displayName!, photoUrl: me!.photoURL!.absoluteString, debt: (self.mEvent?.total)!) // TODO modify debt
            self.mEvent?.friendsPaid.append(friendMe)
            self.mEvent?.friendsShared.append(friendMe)
            self.mTableViewPaid.reloadData()
            self.mTableViewShared.reloadData()
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == mTableViewPaid {
            return (mEvent?.friendsPaid.count)!
        } else if tableView == mTableViewShared {
            return (mEvent?.friendsShared.count)!
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: FriendWithDeptTableViewCell?
        var friend: Friend?
        
        if tableView == mTableViewPaid {
            cell = tableView.dequeueReusableCell(withIdentifier: "PaidTableViewCell", for: indexPath) as? FriendWithDeptTableViewCell
            friend = mEvent?.friendsPaid[indexPath.row]
        } else if tableView == mTableViewShared {
            cell = tableView.dequeueReusableCell(withIdentifier: "SharedTableViewCell", for: indexPath) as? FriendWithDeptTableViewCell
            friend = mEvent?.friendsShared[indexPath.row]
        }
        
        cell?.mLabelName.text = friend?.name
        cell?.mLabelDebt.text! = (friend?.debt.description)!
        // TODO photo
        
        return cell!
    }
    
    @IBAction func createNewEvent(_ sender: UIBarButtonItem) {
        var dictFriendsPaid = [String: [String: Any]]()
        for(index, element) in (mEvent?.friendsPaid.enumerated())! {
            dictFriendsPaid[String(index)] = element.toDictionary()
        }
        
        var dictFriendsShared = [String: [String: Any]]()
        for(index, element) in (mEvent?.friendsShared.enumerated())! {
            dictFriendsShared[String(index)] = element.toDictionary()
        }
        let value: [String:Any] = ["key": mEvent?.key ?? "", "title":mEvent?.title ?? "", "photoUrl":mEvent?.photoUrl ?? "", "subtotal":mEvent?.subtotal ?? 0, "tax":mEvent?.tax ?? 0, "total":mEvent?.total ?? 0, "friendsPaid":dictFriendsPaid, "friendsShared":dictFriendsShared]
        mRef.child("events").child(mGroupKey).childByAutoId().setValue(value) {
            (error, ref) in if error == nil {
                self.presentingViewController?.dismiss(animated: true, completion: nil)
            }
        }
    }
}
