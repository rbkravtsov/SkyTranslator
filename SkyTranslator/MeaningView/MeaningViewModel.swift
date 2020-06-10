//
//  MeaningViewModel.swift
//  SkyTranslator
//
//  Created by Roman Kravtsov on 09.06.2020.
//  Copyright © 2020 Roman Kravtsov. All rights reserved.
//

import SwiftUI
import Combine

class MeaningViewModel: ObservableObject {
    @Published var dataSource: [MeaningRowViewModel] = []
    
    let idsArray: [Int]
    
    private let dataFetcher: DataFetchable
    private var disposables = Set<AnyCancellable>()
    
    init(idsArray: [Int], dataFetcher: DataFetchable) {
        self.idsArray = idsArray
        self.dataFetcher = dataFetcher
    }
    
    func getTranslations() {
        dataFetcher
            .translationDetails(ids: idsArray)
            .map { response in
                response.map(MeaningRowViewModel.init)
            }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] value in
                guard let self = self else { return }
                switch value {
                case .failure:
                    self.dataSource = []
                case .finished:
                    break
                }
                }, receiveValue: { [weak self] meanings in
                    guard let self = self else { return }
                    self.dataSource = meanings
            })
            .store(in: &disposables)
    }
}
