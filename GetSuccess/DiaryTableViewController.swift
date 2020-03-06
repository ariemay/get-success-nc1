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
        getStoreData()
        diaryListTable.dataSource = self
        diaryListTable.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
            case "createDiary":
                let vc = segue.destination as! CreateDiaryViewController
                vc.delegate = self
            case "detailDiary":
                if let indexPath = self.tableView.indexPathForSelectedRow {
                    let controller = segue.destination as! DetailDiaryViewController
                    controller.data = self.myarray[indexPath.row]
                }
            default:
                _ = ""
            }
        }
        
        func apply(_ diary: Diary) {
            myarray.insert(diary, at: 0)
            storeData(myarray)
        }
        
        func didCreateDiary(controller: CreateDiaryViewController, diary: Diary) {
            apply(diary)
             controller.navigationController?.popViewController(animated: true)
        }
    
        func storeData(_ diary: [Diary]) -> Void {
            let diaryData = try! JSONEncoder().encode(diary)
            UserDefaults.standard.set(diaryData, forKey: "diary")
            diaryListTable.reloadData()
        }
        
        func getStoreData() {
            let diaryData = UserDefaults.standard.data(forKey: "diary")
            if let data = diaryData {
                print(data)
                let diaryArray = try! JSONDecoder().decode(Array<Diary>.self, from: data)
                myarray = diaryArray
                print(myarray)
            }
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
}
