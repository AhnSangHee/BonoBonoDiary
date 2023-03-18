//
//  DiaryView.swift
//  BonoBonoDiary
//
//  Created by Selina on 2023/03/19.
//

import SwiftUI

struct DiaryView: View {
    
    private var diary: Diary
    
    init(diary: Diary) {
        self.diary = diary
    }
    
    var body: some View {
        ZStack {
            Common.bonobonoGradient
                .ignoresSafeArea()
            
            VStack() {
                HStack {
                    Text(diary.title)
                        .padding()
                    
                    Spacer()
                }
                
                Color.black
                    .frame(height: 1)
                    .padding(.leading)
                    .padding(.trailing)
                
                HStack {
                    Text(diary.content)
                        .padding()
                        .cornerRadius(8)
                    
                    Spacer()
                }
                
                Spacer()
                
                BottomBonoBonoView()
            }
        }
        .navigationTitle(diary.date)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DiaryView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryView(
            diary: Diary(
                title: "제목",
                content: "내용",
                date: "날짜"
            )
        )
    }
}
