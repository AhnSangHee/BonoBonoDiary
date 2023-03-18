//
//  DiaryPostView.swift
//  BonoBonoDiary
//
//  Created by Selina on 2023/03/17.
//

import SwiftUI

struct DiaryPostView: View {
    private let hueColors = stride(from: 0, to: 1, by: 0.01).map {
        Color(hue: $0, saturation: 1, brightness: 1)
    }
    
    @State private var title: String = ""
    @State private var content: String = ""
    
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: hueColors),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .ignoresSafeArea()
            
            VStack {
                TextField("제목><?", text: $title)
                    .padding()
                
                Color.black
                    .frame(height: 1)
                    .padding(.leading)
                    .padding(.trailing)
                
                ColoredTextEditor(text: $content)
                    .padding()
                    .cornerRadius(8)
                
                BottomBonoBonoView()
            }
            .toolbar {
                NavigationLink {
                    
                } label: {
                    Text("완료")
                        .foregroundColor(.black)
                        .font(.title)
                        .bold()
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DiaryPostView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryPostView()
    }
}

fileprivate struct ColoredTextEditor: UIViewRepresentable {
    
    @Binding var text: String
    @State var coloredText: (String, UIColor?)
    
    init(text: Binding<String>) {
        self._text = text
        self.coloredText = (text.wrappedValue, nil)
    }
    
    func makeUIView(context: Context) -> UITextView {
        let range = (text as NSString).range(of: text)
        let mutableAttributedString = NSMutableAttributedString(string: coloredText.0)
        if let color = coloredText.1 {
            mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        }
        let textView = UITextView()
        textView.attributedText = mutableAttributedString
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        let range = (text as NSString).range(of: text)
        let mutableAttributedString = NSMutableAttributedString(string: coloredText.0)
        if let color = coloredText.1 {
            mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        }
        uiView.attributedText = mutableAttributedString
    }
    
    func color(text: String, color: UIColor) {
        coloredText = (text, color)
    }
}
