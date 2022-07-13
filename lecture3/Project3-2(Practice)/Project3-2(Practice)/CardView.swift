//
//  CardView.swift
//  Project3-2(Practice)
//
//  Created by 홍길동 on 2022/07/13.
//

import SwiftUI

struct CardView: View {
    enum CardState{
        case removed, closed, open
    }
    var state : CardState
    var prefix: String
    var num: Int
    var body: some View {
        if state == .removed{
            Image(systemName: "x.circle")
                .resizable()
                .aspectRatio( contentMode: .fit)
                .opacity(0.5)
        }else{
            Image(imgName)
        }
        
        
    }
    var imgName:String{
        if state == .closed{
            return prefix+"_back"
        }
        
        return "\(prefix)_0\(num)_01"
        //prefix + String(format:"_%02d_01",num)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CardView(state:.open,  prefix: "f", num: 1)
            CardView(state:.open,  prefix: "f", num: 3)
            CardView(state:.closed, prefix: "t", num: 3)
            CardView(state:.removed, prefix: "t", num: 3)
        }
    }
}
