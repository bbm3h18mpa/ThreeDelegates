//
//  KontaktTableViewCell.swift
//  ThreeDelegates
//
//  Created by Florian Panten / BBS2H20A BBM3H18M on 25.10.21.
//

import UIKit

class KontaktTableViewCell: UITableViewCell {
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblGeschlecht: UILabel!
    @IBOutlet weak var lblAlter: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
