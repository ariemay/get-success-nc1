//
//  CreateDiaryViewController.swift
//  GetSuccess
//
//  Created by Arie May Wibowo on 05/03/20.
//  Copyright © 2020 Arie May Wibowo. All rights reserved.
//

import UIKit

protocol CreateDiaryViewControllerDelegate {
//    func didCreateDiary(controller: CreateDiaryViewController, text: String)
    func didCreateDiary(controller: CreateDiaryViewController, diary: Diary)
}

class CreateDiaryViewController: UIViewController {
    
    var delegate : CreateDiaryViewControllerDelegate?

    @IBOutlet weak var addTitleDiary: UITextField!
    @IBOutlet weak var dateDiary: UIDatePicker!
    @IBOutlet weak var contentDiary: UITextView!
    
    var date: String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentDiary?.layer.borderWidth = 0.5
        // Do any additional setup after loading the view.
    }
    
    @IBAction func datePickerClicked(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()

        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short

        let strDate = dateFormatter.string(from: dateDiary.date)
        print(strDate)
        date = strDate
    }
    
    @IBAction func saveNewDiaryData(_ sender: UIButton) {
        let diary = Diary(titleDiary: addTitleDiary.text ?? "untitled", dateDiary: date ?? "", contentDiary: contentDiary.text)
        print(diary)
        delegate?.didCreateDiary(controller: self, diary: diary)
    }
    
}
