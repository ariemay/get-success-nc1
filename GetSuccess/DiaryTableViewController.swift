//
//  DiaryTableViewController.swift
//  GetSuccess
//
//  Created by Arie May Wibowo on 06/03/20.
//  Copyright © 2020 Arie May Wibowo. All rights reserved.
//

import UIKit

class DiaryTableViewCell: UITableViewCell {

    @IBOutlet weak var labelDiaryTitle: UILabel!
    
}

class DiaryTableViewController: UITableViewController, CreateDiaryViewControllerDelegate {
    
    @IBOutlet var diaryListTable: UITableView!
    @IBOutlet weak var addDiaryButton: UIBarButtonItem!
    
    var myarray = [Diary]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        diaryListTable.dataSource = self
        diaryListTable.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            if segue.identifier == "createDiary"{
//                let vc = segue.destination as! CreateDiaryViewController
//                vc.delegate = self
//            }
        switch segue.identifier {
            case "createDiary":
                let vc = segue.destination as! CreateDiaryViewController
                vc.delegate = self
            case "detailDiary":
                let selectedRow = sender as? Int
                let detail = segue.destination as! DetailDiaryViewController
                if myarray[selectedRow!].titleDiary != nil {
                    detail.name = myarray[selectedRow!].titleDiary
                }
            default:
                _ = ""
            }
        }
        
        func apply(_ diary: Diary) {
            myarray.append(diary)
            diaryListTable.reloadData()
        }
        
        func didCreateDiary(controller: CreateDiaryViewController, diary: Diary) {
            apply(diary)
             controller.navigationController?.popViewController(animated: true)
        }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return myarray.count
        }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "diarylist", for: indexPath) as! DiaryTableViewCell
        cell.labelDiaryTitle?.text = myarray[indexPath.item].titleDiary
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(myarray[indexPath.row])
//        self.performSegue(withIdentifier: "detailDiary", sender: self)
        self.performSegue(withIdentifier: "detailDiary", sender: indexPath.row)
    }
   
}
