//
//  RepositoryCell.swift
//  DemoMVVM
//
//  Created by Apple on 05/02/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class RepositoryCell: UITableViewCell {

    @IBOutlet weak var lblTitle       : UILabel!
    @IBOutlet weak var lblDescription : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureCell(_ repositoryCellViewModel : RepositoryCellViewModel)
    {
        lblTitle.text       = repositoryCellViewModel.name
        lblDescription.text = repositoryCellViewModel.detail
    }
    
    /*
    func configureCell(data: Any)
    {
        repositoryCellViewModel.data = data
        repositoryCellViewModel.fillRepositoryCellWithData()
        
        // TODO
        // Set text using delegate
        // Check values before set to label
        
        lblTitle.text       = repositoryCellViewModel.name
        lblDescription.text = repositoryCellViewModel.description
    }
 */
}
