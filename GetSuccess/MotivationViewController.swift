//
//  MotivationViewController.swift
//  GetSuccess
//
//  Created by Arie May Wibowo on 08/03/20.
//  Copyright © 2020 Arie May Wibowo. All rights reserved.
//

import UIKit

class MotivationViewController: UIViewController {

    @IBOutlet weak var imageQuotes: UIImageView!
    @IBOutlet weak var textQuotes: UITextView!
    @IBOutlet weak var nextButton: UIButton!
    
    let images: [UIImage] = [#imageLiteral(resourceName: "elon1"), #imageLiteral(resourceName: "new2")]
    let textQuote: [String] = [
        "When something is important enough, you do it even if the odds are not in your favor.",
        "Life is good...."
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func changeStories(_ sender: UIButton) {
        let index = Int.random(in: 0...1)
        imageQuotes.image = images[index]
        textQuotes.text = textQuote[index]
    }
    

}
