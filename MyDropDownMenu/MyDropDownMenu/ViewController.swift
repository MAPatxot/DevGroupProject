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
        
//        let myView = UIView(frame: navigationController?.navigationBar.frame ?? .zero)
        
        // Adding a background color to see what is being worked on, this will currently replace
        // the "View All" button until figured out
//        myView.backgroundColor = .blue
        
//        navigationController?.navigationBar.topItem?.titleView = myView
        
        // Gesture Recognizer, this code will be neccessary to add the long gesture, will first
        // apply with a single touch to insure the code works
//        guard let topView = navigationController?.navigationBar.topItem?.titleView else {
//            return
//        }
        
        guard let topView = viewAllButton else {
            return
        }
        
        // Adding an anchor to note where the menu should come from
        menu.anchorView = viewAllButton
        
//        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(didTapTopItem))
        
        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(didTapTopItem))
        
// Testing one number of a user press before long press
        gesture.numberOfTouchesRequired = 1
        
        topView.addGestureRecognizer(gesture)
        
        // Console debug to ensure the menu is working when clicked; once it works, comment out
//        menu.selectionAction = { index, title in
//            print("Index \(index) and \(title)")
//        }
    }

    @objc func didTapTopItem() {
        menu.show()
    }

}

