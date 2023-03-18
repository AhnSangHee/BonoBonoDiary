//
//  BonoBonoDiaryApp.swift
//  BonoBonoDiary
//
//  Created by Selina on 2023/03/17.
//

import SwiftUI

@main
struct BonoBonoDiaryApp: App {
    
    @StateObject private var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            DiaryListView()
                .environmentObject(viewModel)
        }
    }
}
