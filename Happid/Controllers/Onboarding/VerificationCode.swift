//
//  VerificationCode.swift
//  Happid
//
//  Created by Anu on 18/02/23.
//

import UIKit

class VerificationCode: UIViewController {
    
    var mobileNumber = " "

    ///Outlets:
    @IBOutlet weak var mobileNumberEditLabel: UITextField!
    
    @IBOutlet weak var otpTextField: UITextField!
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mobileNumberEditLabel.text = mobileNumber

        ///Keyboard dismiss
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
    
    }
    
   

    @IBAction func SubmitSuccess(_ sender: Any) {
        
         let a = mobileNumber.prefix(2)
         let b = mobileNumber.suffix(2)
         let otp = ( a + b )
         print(otp)
        
        if (otpTextField.text! == otp) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let resultViewController = storyBoard.instantiateViewController(withIdentifier: "CreateProfile") as! CreateProfile
        self.navigationController?.pushViewController(resultViewController, animated: true)
        }
        else {
            print("Wrong OTP Entered")
        }
    }
    
}




