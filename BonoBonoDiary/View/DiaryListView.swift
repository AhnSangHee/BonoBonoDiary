//
//  DiaryListView.swift
//  BonoBonoDiary
//
//  Created by Selina on 2023/03/17.
//

import SwiftUI

struct DiaryListView: View {
    let diaryList: [Diary] = [
        Diary(title: "제목1제목1제목1제목1제목1제목1제목1제목1제목1제목1", content: "내용1", date: Date.currentDateToString()),
        Diary(title: "제목2", content: "내용2", date: Date.currentDateToString()),
        Diary(title: "제목3", content: "내용3", date: Date.currentDateToString()),
        Diary(title: "제목4", content: "내용4", date: Date.currentDateToString()),
        Diary(title: "제목5", content: "내용5", date: Date.currentDateToString()),
        Diary(title: "제목6", content: "내용6", date: Date.currentDateToString()),
        Diary(title: "제목7", content: "내용7", date: Date.currentDateToString())
    ]
    
    private let hueColors = stride(from: 0, to: 1, by: 0.01).map {
        Color(hue: $0, saturation: 1, brightness: 1)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: hueColors),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .ignoresSafeArea()
                
                VStack {
                    ScrollView(showsIndicators: false) {
                        VStack {
                            Spacer()
                            ForEach(0..<diaryList.count, id: \.self) { index in
                                DiaryElementView(title: diaryList[index].title, date: diaryList[index].date)
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                    .frame(height: 100)
                                    .padding(
                                        .init(
                                            top: 0,
                                            leading: 20,
                                            bottom: 0,
                                            trailing: 20
                                        )
                                    )
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 6)
                                            .stroke(Color.black, lineWidth: 3)
                                    )
                            }
                            .background {
                                LinearGradient(
                                    gradient: Gradient(colors: hueColors),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                                .cornerRadius(6)
                            }
                            .padding(
                                .init(
                                    top: 0,
                                    leading: 20,
                                    bottom: 10,
                                    trailing: 20
                                )
                            )
                        }
                        .navigationTitle("보노보노><")
                        .toolbar {
                            NavigationLink {
                                DiaryPostView()
                            } label: {
                                Text("글쓰기")
                                    .foregroundColor(.black)
                                    .font(.title)
                                    .bold()
                            }
                        }
                    }
                    
                    BottomBonoBonoView()
                }
            }
        }
    }
}

struct DiaryListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DiaryListView()
            
            DiaryElementView(
                title: "제목",
                date: Date.currentDateToString()
            )
            .background(.yellow)
            .previewDisplayName("Diary Element View")
        }
    }
}

fileprivate struct DiaryElementView: View {
    let title: String
    let date: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                
                Spacer()
                
                Text(date)
            }
            Spacer()
        }
        .padding(.init(top: 20,
                       leading: 0,
                       bottom: 20,
                       trailing: 0))
    }
}
