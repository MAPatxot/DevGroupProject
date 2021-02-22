//
//  ViewController.swift
//  MyDropDownMenu
//

import DropDown
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var viewAllButton: UIButton!
    
    // Creating DropDown
    let menu: DropDown = {
        let menu = DropDown()
        
        
        // Setting up what the DropDown will display
        menu.dataSource = [
            "Sort Alphabetically",
            "Sort By Recent",
            "Sort By Random"
        ]
        

        // Creating an array for optional custom images **
        let images = [
            "abc",
            "hand.point.right",
            "hand.point.right.fill"
        ]
        // Adding code for our custom menu created under "DropDownCell.swift + .xib"
        menu.cellNib = UINib(nibName: "DropDownCell", bundle: nil)
        menu.customCellConfiguration = { index, title, cell in
            guard let cell = cell as? MyCell else {
                return
            }
            // Optional code to add an image to said cell **
            cell.myImageView.image = UIImage(systemName: images[index])

        }
        
        return menu
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configuring previous code with button
        
        _ = viewAllButton
        

        // Unwrapping my topView
        guard let topView = viewAllButton else {
            return
        }
        
        // Feb22. Adding an anchor to note where the menu should come from
        menu.anchorView = viewAllButton
        
        // Creating our long gesture
        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(didTapTopItem))
        
// Testing a number of a user press before long press
        gesture.numberOfTouchesRequired = 1
        
        topView.addGestureRecognizer(gesture)
        
        
        // CONSOLE DEBUG FOR MENU
        
//        menu.selectionAction = { index, title in
//            print("Index \(index) and \(title)")
//        }
    
    }

    @objc func didTapTopItem() {
        menu.show()
    }

}

