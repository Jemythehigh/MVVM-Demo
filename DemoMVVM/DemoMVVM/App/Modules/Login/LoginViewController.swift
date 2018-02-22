//
//  LoginVC.swift
//  DemoMVVM
//
//  Created by Apple on 04/02/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var tfUsername : UITextField!
    @IBOutlet weak var tfPassword : UITextField!
    
    var loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginViewModel.delegate = self
    }
    
    @IBAction func loginAction(sender : UIButton){
        loginViewModel.username = tfUsername.text
        loginViewModel.password = tfPassword.text
        
        loginViewModel.login()
    }
}

extension LoginViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension LoginViewController : LoginViewModelDelegate{
    func loginView_didLoginSuccess(_ repoVM : RespositoryViewModel){
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let repoVC = storyBoard.instantiateViewController(withIdentifier: "RespositoryVC") as! RespositoryViewController
        repoVC.repositoryViewModel = repoVM
        self.navigationController?.pushViewController(repoVC, animated: true)
    }
    
    func loginView_didLoginFailed(_ errMsg : String){
        let alertController = UIAlertController.init(title: "", message: errMsg, preferredStyle: .alert)
        let okAction: UIAlertAction = UIAlertAction(title: "Ok", style: .cancel) { action -> Void in
            self.dismiss(animated: true, completion: {
            })
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: {
        })
    }
}
