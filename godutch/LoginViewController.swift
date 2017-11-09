//
//  LoginViewController.swift
//  godutch
//
//  Created by 方又生 on 2017/10/23.
//  Copyright © 2017年 方又生. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class LoginViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
//        GIDSignIn.sharedInstance().signIn()
    }
    
    
    @IBAction func loginButtonDown(_ sender: Any) {
        (sender as! UIControl).isEnabled = false
        activityIndicator.startAnimating()
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        // ...
        if error != nil {
            // ...
            return
        }
        
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)
        
//        activityIndicator.startAnimating()
        Auth.auth().signIn(with: credential) { user, error in
            if error != nil {
                print("Auth.auth().signIn error:" + (error?.localizedDescription)!)
            } else {                
                self.performSegue(withIdentifier: "MainSegue", sender: nil)
            }
            
            self.activityIndicator.stopAnimating()
        }        
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // ...
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
