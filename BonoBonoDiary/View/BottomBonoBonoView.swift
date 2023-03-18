//
//  BottomBonoBonoView.swift
//  BonoBonoDiary
//
//  Created by Selina on 2023/03/17.
//

import SwiftUI

struct BottomBonoBonoView: View {
    var body: some View {
        HStack {
            Image("bonobono")
                .resizable()
                .frame(width: 100, height: 100)
            
            Image("bonobono")
                .resizable()
                .frame(width: 100, height: 100)
            
            Image("bonobono")
                .resizable()
                .frame(width: 100, height: 100)
        }
    }
}

struct BottomBonoBonoView_Previews: PreviewProvider {
    static var previews: some View {
        BottomBonoBonoView()
    }
}
