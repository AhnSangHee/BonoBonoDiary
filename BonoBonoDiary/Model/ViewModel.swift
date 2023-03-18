//
//  ViewModel.swift
//  BonoBonoDiary
//
//  Created by Selina on 2023/03/18.
//

import Foundation

final class ViewModel: ObservableObject {
    @Published var diaryList = [Diary]()
}
