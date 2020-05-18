//
//  GDTextField.swift
//  GetItDone
//
//  Created by Robert Morrow on 5/15/20.
//  Copyright © 2020 Athos, Inc. All rights reserved.
//

import UIKit

class GDTextField: UITextField {
    
    init(frame: CGRect = .zero, placeholder: String = "Placeholder", radius: CGFloat = 4, inset: CGFloat = 0) {
        super.init(frame: frame)
        checkIfAutoLayout()
        
        self.placeholder = placeholder
        self.backgroundColor = .white
        self.layer.cornerRadius = radius
        self.textColor = .grayZero
    }
    
    let padding = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 0)

     override open func textRect(forBounds bounds: CGRect) -> CGRect {

       return bounds.inset(by: padding)

     }

     override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {

       return bounds.inset(by: padding)

     }

     override open func editingRect(forBounds bounds: CGRect) -> CGRect {

       return bounds.inset(by: padding)

     }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
