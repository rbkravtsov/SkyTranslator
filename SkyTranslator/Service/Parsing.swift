//
//  Parsing.swift
//  SkyTranslator
//
//  Created by Roman Kravtsov on 08.06.2020.
//  Copyright © 2020 Roman Kravtsov. All rights reserved.
//

import Foundation
import Combine

func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, NetworkError> {
  let decoder = JSONDecoder()

  return Just(data)
    .decode(type: T.self, decoder: decoder)
    .mapError { error in
      .parsing(description: error.localizedDescription)
    }
    .eraseToAnyPublisher()
}
