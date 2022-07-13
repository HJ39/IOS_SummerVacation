//
//  ContentView.swift
//  Project1-2
//
//  Created by 홍길동 on 2022/07/11.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        
        VStack{
            HStack{
                Button{
                   
                
                }label: {
                    Image("prev")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                

                Image(systemName: "1.circle")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(Color.black)
                
                Text("/")
                    .foregroundColor(Color.black)
                    
                    
                
                Image(systemName: "5.circle")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(Color.black)
                
                Button{
                    print("hh")
                }label: {
                    Image("next")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                
                
            }
            
        Image("dog7")
                .resizable()
                
            
        }
        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()

    }
}
