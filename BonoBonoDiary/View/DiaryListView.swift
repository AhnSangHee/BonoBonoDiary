//
//  DiaryListView.swift
//  BonoBonoDiary
//
//  Created by Selina on 2023/03/17.
//

import SwiftUI

struct DiaryListView: View {

    @Environment(\.managedObjectContext) var managedObjectContext

    @FetchRequest(
        entity: DiaryEntity.entity(),
        sortDescriptors: [
            NSSortDescriptor(
                keyPath: \DiaryEntity.date,
                ascending: true
            )
        ]
    ) var diaryList: FetchedResults<DiaryEntity>

    
    var body: some View {
        NavigationView {
            ZStack {
                Common.bonobonoGradient
                    .ignoresSafeArea()
                
                VStack {
                    ScrollView(showsIndicators: false) {
                        VStack {
                            Spacer()
                            ForEach(diaryList, id: \.title) { diaryEntity in
                                NavigationLink {
                                    DiaryView(diaryEntity: diaryEntity)
                                } label: {
                                    DiaryElementView(
                                        diaryEntity: diaryEntity
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
        }
    }
}

fileprivate struct DiaryElementView: View {
    
    private var diaryEntity: DiaryEntity
    
    init(diaryEntity: DiaryEntity) {
        self.diaryEntity = diaryEntity
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(diaryEntity.title ?? "")
                
                Spacer()
                
                Text(diaryEntity.date?.currentDateToString() ?? "")
            }
            Spacer()
        }
        .padding(.init(top: 20,
                       leading: 0,
                       bottom: 20,
                       trailing: 0))
    }
}
