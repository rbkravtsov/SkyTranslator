//
//  ContentView.swift
//  SkyTranslator
//
//  Created by Roman Kravtsov on 08.06.2020.
//  Copyright © 2020 Roman Kravtsov. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var viewModel: WordSearchViewModel
    
    var body: some View {
        NavigationView {
            List {
                SearchBar(text: $viewModel.text)
                
                ForEach(viewModel.dataSource, id: \.id) { item in
                    NavigationLink(destination: MeaningView(viewModel: MeaningViewModel(idsArray: item.meaningIDs, dataFetcher: DataFetcher()))) {
                        SearchViewRow(viewModel: item)
                    }
                   
                }
            }
        }
    }
}
