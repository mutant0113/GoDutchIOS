//
//  EventTableViewController.swift
//  godutch
//
//  Created by 方又生 on 2017/10/23.
//  Copyright © 2017年 方又生. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class EventTableViewController: UITableViewController {
    
    var mGroup: Group!
    
    var mEvents = [Event]()
    var mRef: DatabaseReference = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadEvents()
        
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
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return mEvents.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIndentifier = "EventTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIndentifier, for: indexPath) as? EventTableViewCell else {
            fatalError("The dequeued cell is not an instance of EventTableViewCell")
        }
        
        let event = mEvents[indexPath.row]
        cell.mLabelTitle.text = event.title
        cell.mLabelTotal.text = String(event.subtotal)
        return cell
    }
    
    private func loadEvents() {
        self.mRef.child("events").child(mGroup.key!).observe(.childAdded, with: { snapShot in
            let value = snapShot.value as! NSDictionary
            let child = Event(snapShot: value)
            self.mEvents.append(child)
            self.tableView.reloadData()
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        let navVC = segue.destination as? UINavigationController
        if segue.identifier == "newEventStep1Segue" {
            if let nextVC = navVC?.viewControllers.first as? NewEventStep1ViewController {
                nextVC.mGroupKey = mGroup.key!
            }
        }
    }
}
