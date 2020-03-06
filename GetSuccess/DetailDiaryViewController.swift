//
//  DetailDiaryViewController.swift
//  GetSuccess
//
//  Created by Arie May Wibowo on 06/03/20.
//  Copyright © 2020 Arie May Wibowo. All rights reserved.
//

import UIKit

class DetailDiaryViewController: UIViewController {
    
    @IBOutlet weak var diaryTitle: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var content: UITextView!
    
    
    var data: Diary?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        diaryTitle.text = data?.titleDiary
        date.text = data?.dateDiary
        content.text = data?.contentDiary
    }

}
