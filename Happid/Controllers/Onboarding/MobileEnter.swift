//
//  MobileEnter.swift
//  Happid
//
//  Created by Anu on 18/02/23.
//

import UIKit

class MobileEnter: UIViewController {
    
    
    var mobileNumber = " "
    
    ///Outlets:
    @IBOutlet weak var mobileNumberField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ///Keyboard dismiss
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
        
    }
    
    @IBAction func RequestOTP(_ sender: Any) {
        
        mobileNumber = mobileNumberField.text!
        let a = mobileNumber.prefix(2)
         let b = mobileNumber.suffix(2)
         let otp = ( a + b )
        
        let resultsAlertController = UIAlertController(
          title: "Your Confirmation Code is Below - Enter it And We'll Help You Get Signed In",
          message: nil,
            preferredStyle: .alert
        )
    
        resultsAlertController.addAction(
            UIAlertAction(title: String(otp), style: .default) { _ in
            resultsAlertController.dismiss(animated: true, completion: NextPage)
          }
        )
        present(resultsAlertController, animated: true, completion: nil)
        func NextPage() {
            performSegue(withIdentifier: "MobileNumber", sender: self)
        }
                
            }
                override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                    var vc = segue.destination as! VerificationCode
                    vc.mobileNumber = self.mobileNumber
                }
}


