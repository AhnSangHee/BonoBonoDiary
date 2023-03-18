//
//  BonoBonoDiaryApp.swift
//  BonoBonoDiary
//
//  Created by Selina on 2023/03/17.
//

import SwiftUI

@main
struct BonoBonoDiaryApp: App {
    
    private let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            DiaryListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
