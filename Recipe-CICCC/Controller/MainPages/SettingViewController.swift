//
//  SettingViewController.swift
//  Recipe-CICCC
//
//  Created by fangyilai on 2020-04-01.
//  Copyright © 2020 Argus Chen. All rights reserved.
//

import UIKit
import Firebase

class SettingViewController: UIViewController {
    
    @IBOutlet weak var accounttableView: UITableView!
    @IBOutlet weak var preferenceTableVIew: UITableView!
    
    let accountTitle = ["Name:", "Email:"]
    var accountData = ["name","email"]
    
    let preferenceTitle = ["Allergies or Dislike Ingredients", "Meal Size","Cuisine Type"]

    let allergies = ["Peanut","Onion","Egg","Milk"]
    let mealSize = ["1-2","3-4","5-6","7-8","9-10","above 10"]
    let cuisineType = ["Chinese","Japanese","Korean","Canadian"]
    var arrayPicker = [[String]]()
    var array = [String]()
    var selectItem = String()
    var pickItem = Bool()
    var arrayRow = Int()
    
    var textfield = UITextField()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        accounttableView.delegate = self
        accounttableView.dataSource = self
        preferenceTableVIew.delegate = self
        preferenceTableVIew.dataSource = self
        
        pickItem = false
        
        self.accounttableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.preferenceTableVIew.separatorStyle = UITableViewCell.SeparatorStyle.none
        accounttableView.isHidden = true
        preferenceTableVIew.isHidden = true
        let name = Auth.auth().currentUser?.displayName
        let email = Auth.auth().currentUser?.email
        accountData[0] = name ?? ""
        accountData[1] = email ?? ""
        
        arrayPicker = [allergies,mealSize,cuisineType]
    }
    
    @objc func closeKeyboard(){
           self.view.endEditing(true)
    }

    @IBAction func accountBtnClick(_ sender: Any) {
        UIView.animate(withDuration: 0.3) {
            self.accounttableView.isHidden = !self.accounttableView.isHidden
        }
    }
    
    @IBAction func preferenceBtnClick(_ sender: Any) {
        UIView.animate(withDuration: 0.3) {
        self.preferenceTableVIew.isHidden = !self.preferenceTableVIew.isHidden
        }
    }
    

}

extension SettingViewController: UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == accounttableView{
        return accountTitle.count
        }
        return preferenceTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == accounttableView{
            let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell") as! AccountSettingTableViewCell
            cell.accountLabel.text = accountTitle[indexPath.row]
            cell.infoLabel.text = accountData[indexPath.row]
            return cell
        }
    
            let cell = tableView.dequeueReusableCell(withIdentifier: "preferenceCell") as! PreferenceTableViewCell
            cell.title.text = preferenceTitle[indexPath.row]
            cell.choices.text = "Choose your answer..."
            return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == accounttableView{
            switch indexPath.row{
            case 0:
                print("select row 0")
                let vc = UIStoryboard(name: "Setting", bundle: nil).instantiateViewController(withIdentifier: "preferences") as! AccountSettingViewController
                  vc.row = indexPath.row
                  vc.OriginalData = accountData[0]
                self.navigationController?.pushViewController(vc, animated: true)
            case 1:
                print("select row 1")
                let vc = UIStoryboard(name: "Setting", bundle: nil).instantiateViewController(withIdentifier: "preferences") as! AccountSettingViewController
                vc.row = indexPath.row
                vc.OriginalData = accountData[1]
                self.navigationController?.pushViewController(vc, animated: true)
            default:
                print("No row be selected")
            }
        }else{
        print("select PreferenceTableView")
            print("row:\(indexPath.row)")
        }
    }
}
