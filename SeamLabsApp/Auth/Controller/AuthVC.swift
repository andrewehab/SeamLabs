//
//  AuthVC.swift
//  SeamLabsApp
//
//  Created by AnDy on 7/8/19.
//  Copyright © 2019 AnDy. All rights reserved.
//

import UIKit
import Lottie
import Alamofire

class AuthVC: UIViewController {
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    
    @IBOutlet weak var usernameTextField: PaddingTextField!
    @IBOutlet weak var passwordTextFeild: PaddingTextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.RoundedButton(cornerRadius: 20, borderWidth: nil, borderColor: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NetworkManager.requestNewToken() { (success, error) in
            if success{
                print("New Access Token is Requested")
            } else {
                print("Can't Access New Token")
            }
        }
    }
    
    
    @IBAction func loginButtonWasPressed(_ sender: UIButton) {
        
        showSpinner(onView: view)
        
        // if usename empty show warning message
        guard let usernameTextField = usernameTextField.text , usernameTextField.isEmpty == false else {
            showAltertControllerWithAction(title: "Warning", message: "Username Can't be Empty", altertStyle: .alert, actionTitle: "Okay", actionStyle: .default)
            return
        }
        
        // if usename empty show warning message
        guard let passwordTextFeild = passwordTextFeild.text , passwordTextFeild.isEmpty == false else {
            showAltertControllerWithAction(title: "Warning", message: "Password Can't be Empty", altertStyle: .alert, actionTitle: "Okay", actionStyle: .default)
            return
        }
        
        RequestData.instance.usernameData = usernameTextField
        RequestData.instance.passwordData = passwordTextFeild
        
        NetworkManager.loginIntoApp() {[weak self] (success, error) in
            guard let self = self else { return }
            if success {
                self.removeSpinner()
                let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
                let tabBarVC = storyBoard.instantiateViewController(withIdentifier: "TabBarVC")
                self.present(tabBarVC , animated: true , completion: nil)
            } else {
                self.removeSpinner()
                
                let errors =  ErrorHandling.instance.checkError()
                self.showAltertControllerWithAction(title: "Error", message: errors, altertStyle: .alert, actionTitle: "Okay", actionStyle: .default)
                print(error!.localizedDescription)
                return
                
            }
        }
    }
    
    
}



