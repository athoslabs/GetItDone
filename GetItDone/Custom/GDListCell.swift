//
//  GDListCell.swift
//  GetItDone
//
//  Created by Robert Morrow on 5/18/20.
//  Copyright © 2020 Athos, Inc. All rights reserved.
//

import UIKit

class GDListCell: UITableViewCell {
    
//    let titleLabel = GDLabel(color: .grayZero, size: 14)
    let textField = GDTextField(placeholder: "ToDo", radius: 0, inset: 14)
    let view: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let box = GDCheckBox()
    
    
    var toDo: ToDo? {
        didSet {
            if let toDo = toDo {
                box.toggled = toDo.status
                box.id = toDo.id
                textField.text = toDo.title
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        backgroundColor = .clear
        
        view.backgroundColor = .white
        
        addSubview(view)
        view.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        view.topAnchor.constraint(equalTo: topAnchor, constant: 3).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3).isActive = true
        view.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        addSubview(textField)
        textField.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        textField.topAnchor.constraint(equalTo: topAnchor, constant: 3).isActive = true
        textField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3).isActive = true
        textField.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        addSubview(box)
        box.rightAnchor.constraint(equalTo: rightAnchor, constant: -14).isActive = true
        box.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        box.widthAnchor.constraint(equalToConstant: 22).isActive = true
        box.heightAnchor.constraint(equalTo: box.widthAnchor).isActive = true
        

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
