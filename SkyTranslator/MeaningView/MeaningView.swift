//
//  MeaningView.swift
//  SkyTranslator
//
//  Created by Roman Kravtsov on 09.06.2020.
//  Copyright © 2020 Roman Kravtsov. All rights reserved.
//

import SwiftUI

struct MeaningView: View {
    
    @ObservedObject var viewModel: MeaningViewModel
    
    init(viewModel: MeaningViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List(content: content)
            .onAppear(perform: viewModel.getTranslations)        
    }
}

private extension MeaningView {
    func content() -> some View {
        if viewModel.dataSource.count > 0 {
            return AnyView(details(for: viewModel.dataSource))
        } else {
            return AnyView(loading)
        }
    }

    func details(for viewModel: [MeaningRowViewModel]) -> some View {
        ForEach(viewModel, content: MeaningViewRow.init(viewModel:))
    }

    var loading: some View {
        Text("Loading translation")
            .foregroundColor(.gray)
    }
}
