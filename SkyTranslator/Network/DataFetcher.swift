//
//  DataFetcher.swift
//  SkyTranslator
//
//  Created by Roman Kravtsov on 08.06.2020.
//  Copyright © 2020 Roman Kravtsov. All rights reserved.
//

import Foundation
import Combine

protocol DataFetchable {
    func searchTranslations(text: String) -> AnyPublisher<[WordSearchItem], NetworkError>
    func translationDetails(ids: [Int]) -> AnyPublisher<[Meaning], NetworkError>
}

class DataFetcher: DataFetchable {
    
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func searchTranslations(text: String) -> AnyPublisher<[WordSearchItem], NetworkError> {
        return makeResponse(with: makeSearchTranslationsComponents(text: text))
    }
    
    func translationDetails(ids: [Int]) -> AnyPublisher<[Meaning], NetworkError> {
        let idsString = ids.map { String($0) }
                        .joined(separator: ",")
        return makeResponse(with: makeTranslationDetailsComponents(ids: idsString))
    }
    
    private func makeResponse<T>(with components: URLComponents) -> AnyPublisher<T, NetworkError> where T: Decodable {
        guard let url = components.url else {
          let error = NetworkError.network(description: "Couldn't create URL")
          return Fail(error: error).eraseToAnyPublisher()
        }

        return session.dataTaskPublisher(for: URLRequest(url: url))
            .mapError { error in
                .network(description: error.localizedDescription)
            }
            .flatMap(maxPublishers: .max(1)) { pair in
                decode(pair.data)
            }
            .eraseToAnyPublisher()
    }
}

private extension DataFetcher {
    struct skyengAPI {
        static let scheme = "https"
        static let host = "dictionary.skyeng.ru"
        static let path = "/api/public/v1"
    }
    
    func makeSearchTranslationsComponents(text: String) -> URLComponents {
        var components = URLComponents()
        
        components.scheme = skyengAPI.scheme
        components.host = skyengAPI.host
        components.path = skyengAPI.path + "/words/search"
        
        components.queryItems = [URLQueryItem(name: "search", value: text)]
        
        return components
    }
    
    func makeTranslationDetailsComponents(ids: String) -> URLComponents {
        var components = URLComponents()
        
        components.scheme = skyengAPI.scheme
        components.host = skyengAPI.host
        components.path = skyengAPI.path + "/meanings"
        
        components.queryItems = [URLQueryItem(name: "ids", value: ids)]
        
        return components
    }
}
