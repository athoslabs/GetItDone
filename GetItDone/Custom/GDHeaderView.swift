//
//  GDHeaderView.swift
//  GetItDone
//
//  Created by Robert Morrow on 5/15/20.
//  Copyright © 2020 Athos, Inc. All rights reserved.
//

import UIKit

class GDHeaderView: UIView {
    
    let bg = GDGradient()
    let titleLabel = GDLabel(size: 14)
    let subtitleLabel = GDLabel(size: 24)
    let addButton = GDButton(type: .squareIcon)
    
    var delegate: GDHeaderDelegate?
    
    var itemsLeft: Int = 0 {
        didSet {
            self.subtitleLabel.text = "\(itemsLeft) left"
        }
    }
    
    init(frame: CGRect = .zero, title: String = "Header Title", subtitle: String = "Header Subtitle") {
        super.init(frame: frame)
        
        if frame == .zero {
            translatesAutoresizingMaskIntoConstraints = false
        }
        
        self.titleLabel.text = title
        self.subtitleLabel.text = subtitle
        setupLayout()
    }
    
    func setupLayout() {
        addSubview(bg)
        bg.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        bg.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        bg.topAnchor.constraint(equalTo: topAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        addSubview(titleLabel)
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 12).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20 + 16).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(subtitleLabel)
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        subtitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20 + 16).isActive = true
        subtitleLabel.rightAnchor.constraint(equalTo: centerXAnchor, constant: 50).isActive = true
        
        addSubview(addButton)
        addButton.bottomAnchor.constraint(equalTo: subtitleLabel.bottomAnchor).isActive = true
        addButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -20 - 16 - 14).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        addButton.widthAnchor.constraint(equalTo: addButton.heightAnchor, multiplier: 1).isActive = true
        
        addButton.addTarget(self, action: #selector(self.handleAddButton), for: .touchUpInside)
    }
    
    @objc func handleAddButton() {
        if let delegate = self.delegate {
            delegate.openAddItemPopUp()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
