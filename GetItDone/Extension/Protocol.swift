//
//  Protocol.swift
//  GetItDone
//
//  Created by Robert Morrow on 5/15/20.
//  Copyright © 2020 Athos, Inc. All rights reserved.
//

import Foundation

protocol GDHeaderDelegate {
    func openAddItemPopUp() 
}

protocol GDNewItemDelegate {
    func addItemToList(text: String)
}

protocol GDListCellDelegate {
    func toggleToDo(id: Int, status: Bool)
}
