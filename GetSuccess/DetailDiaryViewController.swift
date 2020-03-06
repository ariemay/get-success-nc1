//
//  DetailDiaryViewController.swift
//  GetSuccess
//
//  Created by Arie May Wibowo on 06/03/20.
//  Copyright © 2020 Arie May Wibowo. All rights reserved.
//

import UIKit

class DetailDiaryViewController: UIViewController {
    
    @IBOutlet weak var tester: UILabel!
    
    var data: String = "test"
    var dataDetail: Diary?
    var name: String? = ""
    
    override func viewWillAppear(_ animated: Bool) {
        name = dataDetail?.titleDiary ?? ""
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        data = "testt"
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
