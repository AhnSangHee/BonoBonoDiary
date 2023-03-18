//
//  DiaryPostView.swift
//  BonoBonoDiary
//
//  Created by Selina on 2023/03/17.
//

import SwiftUI

struct DiaryPostView: View {
    
    @State private var title: String = ""
    @State private var content: String = ""
    
    @EnvironmentObject var viewModel: ViewModel
    
    @Environment(\.dismiss) var dismiss
    
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack {
            Common.bonobonoGradient
                .ignoresSafeArea()
            
            VStack {
                TextField("제목><?", text: $title)
                    .padding()
                
                Color.black
                    .frame(height: 1)
                    .padding(.leading)
                    .padding(.trailing)
                
                TextEditor(text: $content)
                    .background(
                        ZStack {
                            Color.blue
                        }
                    )
                    .opacity(0.1)
                    .padding()
                    .cornerRadius(8)
                
                BottomBonoBonoView()
            }
            .toolbar {
                Button {
                    viewModel.diaryList.insert(
                        Diary(
                            title: title,
                            content: content,
                            date: Date().currentDateToString()
                        ),
                        at: 0
                    )
                    
                    self.dismiss()
                } label: {
                    Text("완료")
                        .foregroundColor(.black)
                        .font(.title)
                        .bold()
                }
            }
        }
        .navigationTitle("다요리 쓰기")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DiaryPostView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryPostView()
    }
}
