//
//  WordSearchViewModel.swift
//  SkyTranslator
//
//  Created by Roman Kravtsov on 08.06.2020.
//  Copyright © 2020 Roman Kravtsov. All rights reserved.
//

import SwiftUI
import Combine

final class WordSearchViewModel: ObservableObject, Identifiable {
    
    @Published var text: String = ""
    
    @Published var dataSource: [WordSearchRowViewModel] = []
    
    private let dataFetcher: DataFetcher
    
    private var disposables = Set<AnyCancellable>()
    
    init(dataFetcher: DataFetcher, scheduler: DispatchQueue = DispatchQueue(label: "WordSearchViewModel")) {
        self.dataFetcher = dataFetcher
        
        $text
            .dropFirst(1)
            .debounce(for: .seconds(0.5), scheduler: scheduler)
            .sink(receiveValue: searchWord(text:))
            .store(in: &disposables)            

    }
    
    func searchWord(text: String) {
        dataFetcher.searchTranslations(text: text)
            .map { response in
                response.map(WordSearchRowViewModel.init)
            }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [ weak self ] value in
                guard let self = self else { return }
                switch value {
                case .failure:
                    self.dataSource = []
                case .finished:
                    break
                }
            }, receiveValue: { [ weak self ] result in
                guard let self = self else { return }
                self.dataSource = result
            })
            .store(in: &disposables)
    }
}
