//
//  MyCell.swift
//  MyDropDownMenu
//

import DropDown
import UIKit

class MyCell: DropDownCell {
    
    // Creating an outlet for the image view
    @IBOutlet var myImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        myImageView.contentMode = .scaleAspectFit
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
