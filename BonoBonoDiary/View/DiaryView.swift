//
//  DiaryView.swift
//  BonoBonoDiary
//
//  Created by Selina on 2023/03/19.
//

import SwiftUI

struct DiaryView: View {
    
    private var diaryEntity: DiaryEntity
    
    init(diaryEntity: DiaryEntity) {
        self.diaryEntity = diaryEntity
    }
    
    var body: some View {
        ZStack {
            Common.bonobonoGradient
                .ignoresSafeArea()
            
            VStack() {
                HStack {
                    Text(diaryEntity.title ?? "")
                        .padding()
                    
                    Spacer()
                }
                
                Color.black
                    .frame(height: 1)
                    .padding(.leading)
                    .padding(.trailing)
                
                HStack {
                    Text(diaryEntity.content ?? "")
                        .padding()
                        .cornerRadius(8)
                    
                    Spacer()
                }
                
                Spacer()
                
                BottomBonoBonoView()
            }
        }
        .navigationTitle(diaryEntity.date?.currentDateToString() ?? "")
        .navigationBarTitleDisplayMode(.inline)
    }
}
