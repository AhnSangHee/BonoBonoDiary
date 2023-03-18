//
//  BonoBonoDiaryApp.swift
//  BonoBonoDiary
//
//  Created by Selina on 2023/03/17.
//

import SwiftUI

@main
struct BonoBonoDiaryApp: App {
    
    @ObservedObject private var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            DiaryListView(viewModel: viewModel)
        }
    }
}
