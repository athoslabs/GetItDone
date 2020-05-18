//
//  GDButton.swift
//  GetItDone
//
//  Created by Robert Morrow on 5/14/20.
//  Copyright © 2020 Athos, Inc. All rights reserved.
//

import UIKit

class GDButton: UIButton {
    
    var title: String!
    var type: ButtonOptions!
    var radius: CGFloat!
    
    init(title: String = "Default Text", frame: CGRect = .zero, type: ButtonOptions = .roundedText, radius: CGFloat = 20) {
        super.init(frame: frame)
        
        if frame == .zero {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        
        self.title = title
        self.type = type
        self.radius = radius
        phaseTwo()

    }
    
    func phaseTwo() {
        self.setTitle(self.title, for: .normal)
        self.setTitleColor(.grayZero, for: .normal)
        self.backgroundColor = .white
        
        if let titleLabel = self.titleLabel {
            titleLabel.font = UIFont.init(name: "Raleway-Regular", size: 16)
        }
        
        switch self.type {
            case ButtonOptions.roundedText:
                self.roundedText()
            case ButtonOptions.squareIcon:
                self.squareIcon()
            default:
                break
        }
    }
    
    func squareIcon() {
        // This is where we will set custom icons
        if let titleLabel = self.titleLabel {
            titleLabel.font = UIFont.init(name: "Raleway-Regular", size: 24)
        }
    }
    
    func roundedText() {
        self.layer.cornerRadius = self.radius
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
