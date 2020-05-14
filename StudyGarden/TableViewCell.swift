//
//  TableViewCell.swift
//  StudyGarden
//
//  Created by user168001 on 5/13/20.
//  Copyright © 2020 ProyectoFinal. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var imagenArbol: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
