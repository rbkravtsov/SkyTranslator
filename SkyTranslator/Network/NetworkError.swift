//
//  NetworkError.swift
//  SkyTranslator
//
//  Created by Roman Kravtsov on 08.06.2020.
//  Copyright © 2020 Roman Kravtsov. All rights reserved.
//

import Foundation

enum NetworkError: Error {
  case parsing(description: String)
  case network(description: String)
}
