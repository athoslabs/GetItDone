//
//  ListController.swift
//  GetItDone
//
//  Created by Robert Morrow on 5/15/20.
//  Copyright © 2020 Athos, Inc. All rights reserved.
//

import UIKit

class ListController: UIViewController, GDHeaderDelegate, GDNewItemDelegate {
    
    var popupLocation: CGFloat = -70
    
    func openAddItemPopUp() {
        popup.animatePopUp()
    }
    
    func notInList(text: String) -> Bool {
        var isNotInList = true
        self.listData.forEach { (toDo) in
            if toDo.title == text {
                isNotInList = false
            }
        }
        return isNotInList
    }
    
    func addItemToList(text: String) {
        if (notInList(text: text)) {
            let newItem = ToDo(id: self.listData.count, title: text, status: false)
            self.listData.append(newItem)
            self.listTable.reloadData()
            self.updateHeaderItemsLeft()
            self.popup.textField.text = ""
            self.popup.animatePopUp()
        }

    }
    
    let header = GDHeaderView(title: "Stuff to get done", subtitle: "4 Left")
    let popup = GDNewItemPopup()
    let tbInset: CGFloat = 16
    var bgBottom: NSLayoutConstraint!
    
    lazy var bg: UIView = {
       let view = GDGradient()
        view.layer.cornerRadius = tbInset
        return view
    }()
    
    let listTable = GDTableView()

    let CELL_ID = "cell_id"
    
    var listData: [ToDo] = [ToDo]()
    
    var keyboardHeight:CGFloat = 336
    
    override func viewDidAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardDidShowNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        let keyboardSize = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.size
        self.keyboardHeight = keyboardSize.height
        
    }
    
    func updateHeaderItemsLeft() {
        header.itemsLeft = 0
        self.listData.forEach { (toDo) in
            if !toDo.status { header.itemsLeft += 1 }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listData = []
        
        self.updateHeaderItemsLeft()
        
        view.backgroundColor = .white
        
        view.addSubview(header)
        header.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        header.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        header.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        header.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        view.addSubview(bg)
        bg.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        bg.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 20).isActive = true
        bgBottom = bg.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
        bgBottom.isActive = true
        bg.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
        view.addSubview(listTable)
        listTable.leftAnchor.constraint(equalTo: bg.leftAnchor, constant: tbInset).isActive = true
        listTable.topAnchor.constraint(equalTo: bg.topAnchor, constant: tbInset).isActive = true
        listTable.bottomAnchor.constraint(equalTo: bg.bottomAnchor, constant: -tbInset).isActive = true
        listTable.rightAnchor.constraint(equalTo: bg.rightAnchor, constant: -tbInset).isActive = true
        
        view.addSubview(popup)
        popup.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 70).isActive = true
        popup.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        popup.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        popup.heightAnchor.constraint(equalToConstant: 80).isActive = true

        popup.textField.delegate = self
        popup.delegate = self
        header.delegate = self
        listTable.delegate = self
        listTable.dataSource = self
        listTable.register(GDListCell.self, forCellReuseIdentifier: CELL_ID)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension ListController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {

        var heightToAnimate = -keyboardHeight - 20
        
        if textField == popup.textField {
            popup.animateView(transform: CGAffineTransform(translationX: 0, y: -keyboardHeight - 80), duration: 0.50)
            heightToAnimate -= 80
        }
        bgBottom.constant = heightToAnimate
        UIView.animate(withDuration: 0.35) {
            self.view.layoutIfNeeded()
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        bgBottom.constant = -100
        UIView.animate(withDuration: 0.35) {
            self.view.layoutIfNeeded()
        }
        if textField == popup.textField {
            popup.animateView(transform: CGAffineTransform(translationX: 0, y: 0), duration: 0.60)
        }
    }
}

extension ListController: UITableViewDelegate, UITableViewDataSource, GDListCellDelegate {

    func toggleToDo(toDo updatedToDo: ToDo) {
        let newListData = self.listData.map { (oldToDo) -> ToDo in
            if oldToDo.id == updatedToDo.id {
                var newToDo = oldToDo
                newToDo.status = updatedToDo.status
                newToDo.title = updatedToDo.title
                return newToDo
            }
            return oldToDo
        }
        self.listData = newListData
        self.listTable.reloadData()
        self.updateHeaderItemsLeft()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "To Do"
        }
        return "Done"
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let titleForHeader = GDLabel(color: .white, size: 20, frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 44))
        if section == 0 {
            titleForHeader.text = "To Do"
        } else {
            titleForHeader.text = "Done"
        }
        return titleForHeader
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 38
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        self.listData.forEach { (toDo) in
            if section == 0 && !toDo.status {
                count += 1
            } else if section == 1 && toDo.status {
                count += 1
            }
        }
        
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath) as! GDListCell
        
        cell.delegate = self
        cell.textField.delegate = self
        var itemsForSection: [ToDo] = []
        self.listData.forEach { (toDo) in
            if indexPath.section == 0 && !toDo.status {
                itemsForSection.append(toDo)
            } else if indexPath.section == 1 && toDo.status {
                itemsForSection.append(toDo)
            }
        }
        
        cell.toDo = itemsForSection[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 42
    }
    
}
