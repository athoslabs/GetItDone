//
//  GDCheckBox.swift
//  GetItDone
//
//  Created by Robert Morrow on 5/18/20.
//  Copyright © 2020 Athos, Inc. All rights reserved.
//

import UIKit

class GDCheckBox: UIButton {
    
    
    var id: Int?
    
    var toggled: Bool? {
        didSet {
            if let toggled = toggled {
                UIView.animate(withDuration: 0.2) {
                    if toggled {
                        self.backgroundColor = .green
                        self.setImage(UIImage(named: "done-icon"), for: .normal)
                    } else {
                        self.backgroundColor = .clear
                        self.setImage(UIImage(), for: .normal)
                    }
                }
            }
        }
    }
    

    override init(frame: CGRect) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.borderWidth = 1
        layer.borderColor = UIColor.grayZero.cgColor
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
