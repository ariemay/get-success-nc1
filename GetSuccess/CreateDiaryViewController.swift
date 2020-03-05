//
//  CreateDiaryViewController.swift
//  GetSuccess
//
//  Created by Arie May Wibowo on 05/03/20.
//  Copyright © 2020 Arie May Wibowo. All rights reserved.
//

import UIKit

protocol CreateDiaryViewControllerDelegate {
    func didCreateDiary(controller: CreateDiaryViewController, text: String)
}

class CreateDiaryViewController: UIViewController {
    
    var delegate : CreateDiaryViewControllerDelegate! = nil

    @IBOutlet weak var addTitleDiary: UITextField!
    @IBOutlet weak var dateDiary: UIDatePicker!
    @IBOutlet weak var contentDiary: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentDiary!.layer.borderWidth = 0.5
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
