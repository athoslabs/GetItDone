//
//  NewItemPopup.swift
//  GetItDone
//
//  Created by Robert Morrow on 5/15/20.
//  Copyright © 2020 Athos, Inc. All rights reserved.
//

import UIKit

class GDNewItemPopup: GDGradient {
       
    let cancelButton = GDButton(title: "  cancel  ", type: .roundedText, radius: 4)
    let addButton = GDButton(title: "  add  ", type: .roundedText, radius: 4)
    let textField = GDTextField(placeholder: "Enter ToDo Here", inset: 6)
    var delegate: GDNewItemDelegate?
    
    @objc func handleCancel() {
        animatePopUp()
    }
    
    var popupLocation: CGFloat = -70
    
    @objc func animatePopUp() {
        self.animateView(transform: CGAffineTransform(translationX: 0.0, y: popupLocation), duration: 0.3)
        if popupLocation == -70 {
            popupLocation = 0
            textField.resignFirstResponder()
        } else {
            popupLocation = -70
            textField.resignFirstResponder()
        }
    }

    
    @objc func handleAdd() {
        if let delegate = self.delegate, let textFieldText = self.textField.text {
            delegate.addItemToList(text: textFieldText)
        }
    }
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.animatePopUp)))
        
        let inset: CGFloat = 12
        
        self.layer.cornerRadius = 16
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        addSubview(cancelButton)
        cancelButton.leftAnchor.constraint(equalTo: leftAnchor, constant: inset).isActive = true
        cancelButton.topAnchor.constraint(equalTo: topAnchor, constant: inset).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        addSubview(addButton)
        addButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -inset).isActive = true
        addButton.topAnchor.constraint(equalTo: topAnchor, constant: inset).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        addSubview(textField)
        textField.leftAnchor.constraint(equalTo: leftAnchor, constant: inset).isActive = true
        textField.rightAnchor.constraint(equalTo: rightAnchor, constant: -inset).isActive = true
        textField.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 8).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        cancelButton.addTarget(self, action: #selector(self.handleCancel), for: .touchUpInside)
        addButton.addTarget(self, action: #selector(self.handleAdd), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
