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
    var card: Card
    var prefix: String
    
    var timer = Timer.publish(every: 0.1, on: .main, in:  .common).autoconnect()    //Timer
    @State var frameIndex = 1
    
    var body: some View {
        if card.state == .removed{
            Image(systemName: "x.circle")
                .resizable()
                .aspectRatio( contentMode: .fit)
                .opacity(0.1)
                
        }
        else{
            Image(imgName)
                .onReceive(timer) { _ in
                    frameIndex = frameIndex + 1
                    if frameIndex > 8{
                        let img = UIImage(named: imgName)
                        frameIndex = 1
                    }
                }
        }
        
        
    }
    
    var imgName:String{
        if card.state == .closed{
            return prefix+"_back"
        }
        
       // return "\(prefix)_0\(card.number)_0\(frameIndex)"
        return prefix + String(format:"_%02d_%02d",card.number,frameIndex)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CardView(card: Card(state: .open, number: 1), prefix: "f")
            CardView(card: Card(state: .closed, number: 1), prefix: "f")
            
            
        }
    }
}
