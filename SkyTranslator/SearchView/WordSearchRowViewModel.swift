//
//  WordSearchRowViewModel.swift
//  SkyTranslator
//
//  Created by Roman Kravtsov on 08.06.2020.
//  Copyright © 2020 Roman Kravtsov. All rights reserved.
//

import Foundation
import SwiftUI

struct WordSearchRowViewModel: Identifiable {
    private let item: WordSearchItem
  
    var id: Int {
        return item.id
    }
  
    var title: String {
        return item.text
    }
    
    var meaningIDs: [Int] {
        return item.meanings.map { $0.id }
    }
    
    init(item: WordSearchItem) {
        self.item = item
    }
}
