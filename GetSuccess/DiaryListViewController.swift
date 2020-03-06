//
//  DiaryListViewController.swift
//  GetSuccess
//
//  Created by Arie May Wibowo on 05/03/20.
//  Copyright © 2020 Arie May Wibowo. All rights reserved.
//

import UIKit

class DiaryListViewController: UIViewController, CreateDiaryViewControllerDelegate {
    
    @IBOutlet weak var diaryListTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "createDiary"{
            let vc = segue.destination as! CreateDiaryViewController
            vc.delegate = self
        }
    }
    
    
    
    func apply(_ diary: Diary) {
//        test.text = diary.titleDiary
    }
    
    func didCreateDiary(controller: CreateDiaryViewController, diary: Diary) {
        apply(diary)
        controller.navigationController?.popViewController(animated: true)
    }

}
