//
//  GDLabel.swift
//  GetItDone
//
//  Created by Robert Morrow on 5/14/20.
//  Copyright © 2020 Athos, Inc. All rights reserved.
//

import UIKit

class GDLabel: UILabel {
    
    init(title: String = "Default Title", color: UIColor = .white, size: CGFloat = 16, frame: CGRect = .zero, textAlign: NSTextAlignment = .left) {
        super.init(frame: frame)
        
        if frame == .zero {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        self.text = title
        self.textColor = color
        self.font = UIFont.init(name: "Raleway-Regular", size: size)
        self.textAlignment = textAlign
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
