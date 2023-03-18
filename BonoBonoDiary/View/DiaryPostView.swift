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
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) var managedObjectContext
    
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
                    self.saveDiary(title: title, content: content, date: Date())
                    
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
    
    private func saveDiary(title: String, content: String, date: Date) {
        let diary = DiaryEntity(context: managedObjectContext)
        
        diary.title = title
        diary.content = content
        diary.date = date
        
        saveContext()
    }
    
    private func saveContext() {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

struct DiaryPostView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryPostView()
    }
}
