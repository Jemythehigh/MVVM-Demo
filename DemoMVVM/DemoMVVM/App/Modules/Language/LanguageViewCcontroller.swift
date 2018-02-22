//
//  ChangeGitLanguageVC.swift
//  DemoMVVM
//
//  Created by Apple on 07/02/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

protocol ChangeGitLanguageVCDelegate : NSObjectProtocol {
    func performServiceCallForLanguageChange(language : String)
}

class LanguageViewController: UIViewController {
    
    weak var delegate : ChangeGitLanguageVCDelegate?
    
    @IBOutlet weak var tblChangeLanguage : UITableView!
    var arrLanguages : Array<String> = ["swift", "php", "python", "scala"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension LanguageViewController : UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrLanguages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tblChangeLanguage.dequeueReusableCell(withIdentifier: "ChangeLanguageCell", for: indexPath) as! ChangeLanguageCell
        
        // Configure cell here
        cell.lblLanguage.text = arrLanguages[indexPath.row]

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.performServiceCallForLanguageChange( language: arrLanguages[indexPath.row])
        self.navigationController?.popViewController(animated: true)
    }
}
