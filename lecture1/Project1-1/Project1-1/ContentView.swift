//
//  ContentView.swift
//  Project1-1
//
//  Created by 홍길동 on 2022/07/11.
//

import SwiftUI


struct BorderedShadow: ViewModifier{
    func body(content:Content) -> some View{
        content
            .padding()
            .border(Color.green,width: 3)
            .shadow(color: Color.gray, radius: 5, x: 2, y: 5)
    }
}

struct ContentView: View {
    var body: some View {
        VStack{
            
            Button{
                print("Hello")
            }label: {
                Image(systemName: "hurricane")
                    .foregroundColor(Color.black)
            }
            
            Spacer()
      
            
            HStack {
                Text("Hello, world!ㅁㅁㅁㅁ")
                    .padding().background(Color.orange)
                Image(systemName: "tornado").resizable().frame(width: 50, height: 50).foregroundColor(Color.brown)
            }
            
            
            Image("dog3").border(Color.green,width: 8)
                .padding()
                .shadow(color: Color.gray, radius: 5, x: 0, y: 5)
            Image("dog4")
            
            Image("dog5")
            Spacer()
            
            Text("Hello, world!ㅁㅁssㅁㅁ")
                .background(Color.orange)
                .padding().foregroundColor(Color.blue)
                .font(.largeTitle)
                
        }.background(Color.blue)
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()

        }
    }
}
