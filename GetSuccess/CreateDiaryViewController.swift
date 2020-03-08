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
    var textviewActive: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentDiary?.layer.borderWidth = 0.3
        getDate()
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @objc private func textViewDidBeginEditing(notification: Notification) {
        print(notification)
        textviewActive = true
    }
    
    @objc private func textViewDidEndEditing(notification: Notification) {
        textviewActive = false
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
    
    @IBAction func datePickerClicked(_ sender: UIDatePicker) {
        getDate()
    }
    
    func getDate() -> Void {
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
