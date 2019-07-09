//
//  ProfileVC.swift
//  SeamLabsApp
//
//  Created by AnDy on 7/8/19.
//  Copyright © 2019 AnDy. All rights reserved.
//

import UIKit
import Alamofire

class ProfileVC: UIViewController {
    
    
    @IBOutlet weak var charNameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    var count = 0
    var myPassword : String?
    
    override func viewDidLoad() {
        charNameLabel.RoundedLabel(cornerRadius: charNameLabel.frame.width / 2, borderWidth: 1.0, borderColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getUserData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        passwordLabel.text = "********"
    }
    
    @IBAction func logoutButtonWasPressed(_ sender: UIButton) {
        
        let altertViewController = UIAlertController(title: "Logout", message: "Are You Sure You Want Log Out ?", preferredStyle:.alert)
        
        // if user choose logout send him to auth view and remove its data
        let action1 = UIAlertAction(title: "Yes", style: .default) { (action) in
            let useDefaults = UserDefaults.standard
            useDefaults.removeObject(forKey: "usename")
            useDefaults.removeObject(forKey: "password")
            useDefaults.removeObject(forKey: "requestToken")
            
            let storyBoard = UIStoryboard.init(name: "Auth", bundle: nil)
            let authVC = storyBoard.instantiateViewController(withIdentifier: "AuthVC")
            self.present(authVC , animated:  true , completion: nil)
            
        }
        
        let action2 = UIAlertAction(title: "No", style: .default) { (action) in
            return
        }
        
        altertViewController.addAction(action1)
        altertViewController.addAction(action2)
        self.present(altertViewController, animated: true)
    }
    
    
    @IBAction func showPasswordButtonWasPressed(_ sender: UIButton) {
        //check if no of count is odd means show password even hide password
        count = count + 1
        if count % 2 == 0 || count == 0 {
            passwordLabel.text = "********"
        } else {
            passwordLabel.text = myPassword
        }
    }
    
    //MARK GET THE USER DATA FROM USER DEFAULT
    func getUserData() {
        let userDefaults = UserDefaults.standard
        
        let username = userDefaults.value(forKey: "username") as? String
        usernameLabel.text = username
        
        let password = userDefaults.value(forKey: "password") as? String
        myPassword = password
        
        let firstChar = username?[(username?.startIndex)!].uppercased()
        charNameLabel.text = "\(firstChar ?? " ")"
        
    }
}
