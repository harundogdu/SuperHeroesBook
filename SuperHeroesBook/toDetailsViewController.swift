//
//  toDetailsViewController.swift
//  SuperHeroesBook
//
//  Created by Harun on 5.06.2021.
//

import UIKit

class toDetailsViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
    var selectedHeroesName = ""
    var selectedHeroesImage = ""
    var selectedHeroesDescription = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: selectedHeroesImage)
        label.text = selectedHeroesName
        labelDescription.text = selectedHeroesDescription
    }

    

}
