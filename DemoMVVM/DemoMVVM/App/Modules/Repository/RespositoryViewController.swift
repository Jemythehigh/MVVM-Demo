//
//  RespositoryVC.swift
//  DemoMVVM
//
//  Created by Apple on 04/02/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class RespositoryViewController: UIViewController {

    @IBOutlet weak var tblRepository : UITableView!
    var repositoryViewModel : RespositoryViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView(){
        // Add UIBarButton
        let barButtonItem = UIBarButtonItem.init(title: "Language", style: UIBarButtonItemStyle.plain, target: self, action: #selector(editLanguageAction)) 
        self.navigationItem.rightBarButtonItem = barButtonItem
        self.navigationItem.title = "Hi, \(repositoryViewModel.userName)"
        //
        self.tblRepository.estimatedRowHeight = 60
        self.tblRepository.rowHeight = UITableViewAutomaticDimension
        
        repositoryViewModel.delegate = self
    }
    
    // MARK: custom methods
    @objc func editLanguageAction()  {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "ChangeGitLanguageSegue", sender: self)
        }
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "ChangeGitLanguageSegue"{
            let objChangeLanguageVC = segue.destination as! LanguageViewController
            objChangeLanguageVC.delegate = self
        }
    }
}

extension RespositoryViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositoryViewModel.arrRepositoryData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tblRepository.dequeueReusableCell(withIdentifier: "RepositoryCell", for: indexPath) as! RepositoryCell
        
        // Configure cell here
        
        // Sending data Without exposing data model information to view
        cell.configureCell(repositoryViewModel.arrRepositoryData[indexPath.row])
        
        return cell
    }
}

extension RespositoryViewController : RespositoryViewModelDelegate{
    func refreshView() {
        DispatchQueue.main.async {
            self.tblRepository.reloadData()
        }
    }
    
    func showError(_ errMsg : String){
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

extension RespositoryViewController : ChangeGitLanguageVCDelegate{
    func performServiceCallForLanguageChange( language : String) {
        // Perform Service call with changed language
        repositoryViewModel.getRepositoryDetails(language)
    }
}
