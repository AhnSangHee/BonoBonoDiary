//
//  Date+.swift
//  BonoBonoDiary
//
//  Created by Selina on 2023/03/17.
//

import Foundation

extension Date {
    static func currentDateToString() -> String {
        return dateFormatter.string(from: Date())
    }
}

fileprivate let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "ko_kr")
    formatter.dateFormat = "yyyy년 MM월 dd일 HH시 mm분"
    return formatter
}()
