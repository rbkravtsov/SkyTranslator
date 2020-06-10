//
//  MeaningsResponse.swift
//  SkyTranslator
//
//  Created by Roman Kravtsov on 06.06.2020.
//  Copyright © 2020 Roman Kravtsov. All rights reserved.
//

import Foundation

struct Meaning: Decodable {
    let id: String
    let wordId: Int
    let prefix: String?
    let text: String
    let translation: Translation
    let images: [MeaningImage]    
}

struct MeaningDefinition: Decodable {
    let text: String
    let soundUrl: String
}

struct MeaningImage: Decodable {
    let url: String
}


