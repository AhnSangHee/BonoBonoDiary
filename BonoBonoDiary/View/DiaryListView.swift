//
//  DiaryListView.swift
//  BonoBonoDiary
//
//  Created by Selina on 2023/03/17.
//

import SwiftUI

struct DiaryListView: View {

    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                Common.bonobonoGradient
                    .ignoresSafeArea()
                
                VStack {
                    ScrollView(showsIndicators: false) {
                        VStack {
                            Spacer()
                            ForEach(0..<viewModel.diaryList.count, id: \.self) { index in
                                NavigationLink {
                                    DiaryView(
                                        diary: viewModel.diaryList[index]
                                    )
                                } label: {
                                    DiaryElementView(
                                        diary: viewModel.diaryList[index]
                                    )
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
                            }
                            .background {
                                Common.bonobonoGradient
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
                        .navigationTitle("마이 다요리")
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
                .environmentObject(ViewModel())
            
            DiaryElementView(
                diary: Diary(
                    title: "제목",
                    content: "내용",
                    date: "날짜"
                )
            )
            .background(.yellow)
            .previewDisplayName("Diary Element View")
        }
    }
}

fileprivate struct DiaryElementView: View {
    
    private var diary: Diary
    
    init(diary: Diary) {
        self.diary = diary
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(diary.title)
                
                Spacer()
                
                Text(diary.date)
            }
            Spacer()
        }
        .padding(.init(top: 20,
                       leading: 0,
                       bottom: 20,
                       trailing: 0))
    }
}
