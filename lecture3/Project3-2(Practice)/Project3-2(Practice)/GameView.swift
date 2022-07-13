//
//  ContentView.swift
//  Project3-2(Practice)
//
//  Created by 홍길동 on 2022/07/13.
//

import SwiftUI

struct GameView: View {
    var body: some View {
        
        GridStack(rows: 4, columns: 3) { row, column in
            CardView(state: .open, prefix: "f", num: row+column+1)
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
