//
//  MeaningViewRow.swift
//  SkyTranslator
//
//  Created by Roman Kravtsov on 09.06.2020.
//  Copyright © 2020 Roman Kravtsov. All rights reserved.
//

import SwiftUI

struct MeaningViewRow: View {
    
    private let viewModel: MeaningRowViewModel
    
    init(viewModel: MeaningRowViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        HStack {
            imageView()
            VStack {
                Text(viewModel.text)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                Text(viewModel.translation)
                    .font(.caption)
                    .multilineTextAlignment(.leading)
                
            }
        }
    }
    
    private func imageView() -> AnyView? {
        if let uiImage = viewModel.image {
            return AnyView(Image(uiImage: uiImage))
        } else {
            return nil
        }
    }
    
}


