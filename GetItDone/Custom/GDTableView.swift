//
//  GDTableView.swift
//  GetItDone
//
//  Created by Robert Morrow on 5/18/20.
//  Copyright © 2020 Athos, Inc. All rights reserved.
//

import UIKit

class GDTableView: UITableView {
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        checkIfAutoLayout()
        backgroundColor = .clear
        separatorStyle = .none
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
