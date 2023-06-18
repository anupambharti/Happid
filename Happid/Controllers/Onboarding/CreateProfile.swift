//
//  CreateProfile.swift
//  Happid
//
//  Created by Anu on 19/02/23.
//

import UIKit

class CreateProfile: UIViewController {
    
    ///Outlets:
    @IBOutlet weak var firstNameLabel: UITextField!
    
    @IBOutlet weak var lastNameLabel: UITextField!

    @IBOutlet weak var phoneLabel: UITextField!
    
    
    @IBOutlet weak var pinCodeLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //Test
    }
    
    
    @IBAction func submitProfileDetails(_ sender: Any) {
        
        // Prepare URL
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos")
        guard let requestUrl = url else { fatalError() }

        // Prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
         
        // HTTP Request Parameters which will be sent in HTTP Request Body
        let firstName = firstNameLabel.text
        let lastName = lastNameLabel.text
        let phone = phoneLabel.text
        let postCode = pinCodeLabel.text

        // Set HTTP Request Body
        request.httpBody = firstName?.data(using: String.Encoding.utf8);
        request.httpBody = lastName?.data(using: String.Encoding.utf8);
        request.httpBody = phone?.data(using: String.Encoding.utf8);
        request.httpBody = postCode?.data(using: String.Encoding.utf8);

        // Perform HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                // Check for Error
                if let error = error {
                    print("Error took place \(error)")
                    return
                }
         
                // Convert HTTP Response Data to a String
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    print("Response data string:\n \(dataString)")
                }
        }
        task.resume()
    }
    
}
