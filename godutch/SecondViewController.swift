//
//  SecondViewController.swift
//  godutch
//
//  Created by 方又生 on 2017/10/17.
//  Copyright © 2017年 方又生. All rights reserved.
//

import UIKit
import Firebase

class SecondViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func logout(_ sender: UIButton) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            #if DEBUG
            print("Error signing out: %@", signOutError)
            #endif
            return
        }
        
        dismiss(animated: true, completion: nil)
    }
}

