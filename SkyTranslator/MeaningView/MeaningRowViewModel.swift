//
//  MeaningRowViewModel.swift
//  SkyTranslator
//
//  Created by Roman Kravtsov on 09.06.2020.
//  Copyright © 2020 Roman Kravtsov. All rights reserved.
//

import Foundation
import SwiftUI

class MeaningRowViewModel: Identifiable {
    
    private let item: Meaning
    
    var id: String {
        return item.id
    }
    
    var translation: String {
        return item.translation.text
    }
    
    var image: UIImage? {
        guard let urlString = item.images.first?.url,
            let imageURL = URL.fromString(urlString),
            let imageData = try? Data(contentsOf: imageURL)
        else {
            return nil
        }
        
        return UIImage(data: imageData)
    }
    
    var text: String {
        return "\(item.prefix ?? "") \(item.text)"
    }
    
    init(item: Meaning) {
        self.item = item
    }
}
