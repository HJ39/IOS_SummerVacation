//
//  ContentView.swift
//  Project3-1
//
//  Created by 홍길동 on 2022/07/13.
//

import SwiftUI

// Press, Move, Release
// Long Press
// Tap(Click) = Touch up Inside
// Drag, Pan -> Translation (x,y좌표가 값이 바뀌는 것)
// Double Tap, Triple, ...
// Flick(ios) or Fling(android) -> Decelerating 빠르게 제스처를 취한 경우 빠르게 움직이다가 속도가 줄어드는 제스처
// Swipe -> 미리 정해진 방향만 중요시하게 생각함 (보통 2,4방향 정도 사용) Direction
// Pinch -> 줌인, 줌아웃 Scale
// Rotation -> Angle 회전
//

struct ContentView: View {
    
    @State var count = 0
    @State var spinning = false
    @State var visible = false
    @GestureState var angle: Angle = Angle.zero
    
    var body: some View {
        
       let tap = TapGesture()
            .onEnded {
                count = count + 1
            }
        
//        let lpress = LongPressGesture()
//            .onEnded { _ in
//                count = count + 10
//            }
        
        let rot = RotationGesture()
//            .onChanged { angle in
//                print("Angle: \(angle)")
//                self.angle = angle
//
////            }
//            .onEnded { _ in
//                print("Roatation Ended")
//            }
            .updating($angle){
                angle, state, transaction in
                state = angle
            }
        
        
        VStack{
            Text("count = \(count) angle = \(angle.degrees)")
            
            
            ZStack {
                
                Circle()
                    .stroke(.yellow,lineWidth: 5)
                    .background(Circle().fill(
                        RadialGradient(gradient: Gradient(colors:[Color.red,Color.yellow, Color.white]), center: .center, startRadius: 0, endRadius: 100)))
                    .frame(width: 200, height: 200)
                    
                
                Text("Tap me! ")
                    .padding(50)
//                    .border(Color.red,width: 5)
                    .gesture(tap)
                .rotationEffect(angle)
            }
            .rotationEffect(.degrees(spinning ? 360 : 0 ))
            .animation(.linear(duration:1).repeatForever(autoreverses: false), value: spinning ?360 :0)
            .onAppear {
                spinning = true
            }
            
            Toggle(isOn:$visible){
                Text("Toogle®....")
            }
            .frame(width:200)
            
            
            Button{
                spinning = !spinning
                visible = !visible
            }label: {
                Text("Toggle spinning")
                    .padding(5)
                    .background(
                        Capsule().stroke(.brown,lineWidth: 3)
                )
            }
            Spacer()
            if visible{
            
                Path{ path in
                    path.move(to: CGPoint(x:100,y:0))
                    path.addLine(to:CGPoint(x:200,y:100))
                    path.addLine(to:CGPoint(x:300,y:200))
                    path.closeSubpath()
                }
                .stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .butt, lineJoin: .round))
            }
            
            
            HStack{
                Image(systemName: "pencil.and.outline")
                    .resizable()
                    .frame(width: 50, height: 50)
                Text("Rotate Me")
            }
            .padding(50)
            .background(LinearGradient(colors: [Color.yellow, Color.blue,Color.white], startPoint: .topLeading, endPoint: .bottomTrailing))
        }
        .gesture(rot)
           
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
