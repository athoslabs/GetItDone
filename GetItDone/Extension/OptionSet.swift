//
//  OptionSet.swift
//  GetItDone
//
//  Created by Robert Morrow on 5/15/20.
//  Copyright © 2020 Athos, Inc. All rights reserved.
//

import Foundation

struct ButtonOptions: OptionSet {
    let rawValue: Int

    static let roundedText  = ButtonOptions(rawValue: 1 << 0)
    static let squareIcon   = ButtonOptions(rawValue: 1 << 1)
}
