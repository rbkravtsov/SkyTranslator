//
//  URL+fromString.swift
//  SkyTranslator
//
//  Created by Roman Kravtsov on 09.06.2020.
//  Copyright © 2020 Roman Kravtsov. All rights reserved.
//

import Foundation

extension URL {
    static func fromString(_ urlString: String) -> URL? {
        let urlStringWithScheme = "https:" + urlString
        return URL(string: urlStringWithScheme)
    }
}
