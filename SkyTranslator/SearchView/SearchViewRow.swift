//
//  SearchViewRow.swift
//  SkyTranslator
//
//  Created by Roman Kravtsov on 06.06.2020.
//  Copyright © 2020 Roman Kravtsov. All rights reserved.
//

import SwiftUI

struct SearchViewRow: View {
    
    private let viewModel: WordSearchRowViewModel
  
    init(viewModel: WordSearchRowViewModel) {
        self.viewModel = viewModel
    }
  
    var body: some View {
        Text(viewModel.title)
    }

}
