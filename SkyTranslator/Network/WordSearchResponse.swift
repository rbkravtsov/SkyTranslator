//
//  SearchViewModel.swift
//  SkyTranslator
//
//  Created by Roman Kravtsov on 06.06.2020.
//  Copyright © 2020 Roman Kravtsov. All rights reserved.
//

import Foundation

struct WordSearchResponse: Decodable {
    let result: [WordSearchItem]
}

struct WordSearchItem: Decodable {
    let id: Int
    let text: String
    let meanings: [WordSearchMeaning]
}

struct WordSearchMeaning: Decodable {
    let id: Int
    let translation: Translation
}

struct Translation: Decodable {
    let text: String
    let note: String?
}
