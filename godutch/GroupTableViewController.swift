//
//  GroupTableViewController.swift
//  godutch
//
//  Created by 方又生 on 2017/10/20.
//  Copyright © 2017年 方又生. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class GroupTableViewController: UITableViewController {
    
    var mGroups = [Group]()
    var mRef: DatabaseReference = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadGroups()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return mGroups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIndentifier = "GroupTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIndentifier, for: indexPath) as? GroupTableViewCell else {
            fatalError("The dequeued cell is not an instance of GroupTableViewCell")
        }
        
        let group = mGroups[indexPath.row]
        cell.mLabelTitle.text = group.title
        cell.mLabelTotal.text = String(group.subtotal)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "groupSegue" {
            if let nextVC = segue.destination as? EventTableViewController,
                let row = tableView.indexPathForSelectedRow?.row {
                nextVC.mGroup = mGroups[row]
            }
        }
    }
    
    private func loadGroups() {
        let uid = Auth.auth().currentUser?.uid
        self.mRef.child("groups_mapping").child(uid!).observe(.childAdded, with: {snapShot in
            let groupKey = snapShot.value as! String
            self.fetchGroupsByKey(key: groupKey)
        })
    }
    
    private func fetchGroupsByKey(key: String) {
        self.mRef.child("groups").child(key).observeSingleEvent(of: .value, with: { snapShot in
            let value = snapShot.value as! NSDictionary
            let child = Group(snapShot: value)
            child.key = snapShot.key
            self.mGroups.append(child)
            self.tableView.reloadData()
        })
        
    }
}
