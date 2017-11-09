//
//  NewEventStep1ViewController.swift
//  godutch
//
//  Created by 方又生 on 2017/10/31.
//  Copyright © 2017年 方又生. All rights reserved.
//

import UIKit
import os.log

class NewEventStep1ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var mTextFieldTitle: UITextField!
    @IBOutlet weak var mTextFieldSubtotal: UITextField! {
        didSet {
            mTextFieldSubtotal.tag = SUBTOTAL_TAG
            mTextFieldSubtotal.delegate = self
        }
    }
    
    @IBOutlet weak var mButtonTax0: UIButton!
    @IBOutlet weak var mButtonTax10: UIButton!
    @IBOutlet weak var mBarButtonItemNext: UIBarButtonItem!
    @IBOutlet weak var mLabelTotal: UILabel!
    var mGroupKey: String = ""
    var mTax = 0.0
    var mTotal = 0.0
    
    let SUBTOTAL_TAG = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func setTax0(_ sender: UIButton) {
        mTax = 0.0;
        mLabelTotal.text = mTextFieldSubtotal.text!
        mButtonTax0.backgroundColor = .orange
        mButtonTax10.backgroundColor = .white
    }
    
    @IBAction func setTax10(_ sender: UIButton) {
        mTax = 1.1;
        mLabelTotal.text = String(Double(mTextFieldSubtotal.text!)! * mTax)
        mButtonTax0.backgroundColor = .white
        mButtonTax10.backgroundColor = .orange
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.tag == SUBTOTAL_TAG {
            if mTax == 0.0 {
                mButtonTax0.backgroundColor = .orange
            }
            if string.isEmpty {
                mLabelTotal.text = String(textField.text!.dropLast())
            } else {
                mLabelTotal.text = textField.text! + string
            }
        }
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    @IBAction func changeExchangeRate(_ sender: UIButton) {
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        // TODO: popup dialog for double check
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "newEventStep2Segue" && sender as? UIBarButtonItem === mBarButtonItemNext{
            if let nextVC = segue.destination as? NewEventStep2ViewController {
                let event = Event(title: mTextFieldTitle.text!, photoUrl: "", subtotal: Double(mTextFieldSubtotal.text!)!, tax: mTax, total: mTotal, friendsPaid: [Friend](), friendsShared: [Friend]())
                nextVC.mEvent = event
                nextVC.mGroupKey = mGroupKey
            }
        }
    }
}
