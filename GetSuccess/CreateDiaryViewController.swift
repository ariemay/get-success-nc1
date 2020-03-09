//
//  CreateDiaryViewController.swift
//  GetSuccess
//
//  Created by Arie May Wibowo on 05/03/20.
//  Copyright © 2020 Arie May Wibowo. All rights reserved.
//

import UIKit

protocol CreateDiaryViewControllerDelegate {
    func didCreateDiary(controller: CreateDiaryViewController, diary: Diary)
}

class CreateDiaryViewController: UIViewController {
    
    var delegate : CreateDiaryViewControllerDelegate?

    @IBOutlet weak var contentDiary: UITextView!
    
    let alertForSave = UIAlertController(title: "Save diary", message: "Please input your commit title:", preferredStyle: .alert)
    
    var date: String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alertForSave.addTextField { (textfield) in
            textfield.text = ""
        }
        
        alertForSave.addAction(UIAlertAction(title: "Save", style: .default, handler: { [weak alertForSave] (action) in
            let diaryTitle = (alertForSave?.textFields![0])?.text
            let diary = Diary(titleDiary: diaryTitle ?? "untitled", dateDiary: self.date ?? "", contentDiary: self.contentDiary.text)
            self.delegate?.didCreateDiary(controller: self, diary: diary)
        }))
        
        alertForSave.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        contentDiary?.layer.borderWidth = 0.3
        getDate()
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @objc func adjustForKeyboard(notification: Notification)
    {
        let userInfo: [AnyHashable : Any]
        if notification.userInfo != nil {
            userInfo = notification.userInfo!
            let keyboardScreenEndFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
            let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
            if notification.name == UIResponder.keyboardWillHideNotification {
                contentDiary.contentInset = UIEdgeInsets.zero
            } else {
               contentDiary.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height, right: 0)
            }
        }
        
        contentDiary.scrollIndicatorInsets = contentDiary.contentInset
        let selectedRange = contentDiary.selectedRange
        contentDiary.scrollRangeToVisible(selectedRange)
    }

    func getDate() -> Void {
        let dateFormatter = DateFormatter()

        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        
        let now = Date()
        let strDate = dateFormatter.string(from: now)
        print(strDate)
        date = strDate
    }
    
    @IBAction func saveNewDiaryData(_ sender: UIButton) {
        self.present(alertForSave, animated: true)
    }
    
}
