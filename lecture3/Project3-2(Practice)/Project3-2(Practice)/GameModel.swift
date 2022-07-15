//
//  GameModel.swift
//  Project3-2(Practice)
//
//  Created by 홍길동 on 2022/07/14.
//

import Foundation
import SwiftUI

struct Card{
    enum State{
        case removed, closed, open
    }
    var state: State
    let number: Int
    
}

class GameModel: ObservableObject{
    static let rows = 5
    static let cols = 4
    
    //😱 O.M.G~~~
    @Published var flips = 0
    @Published var cards = [Card]() // [Card] = [] 같은 방식
    var openCardIndex : Int?
    private var count = 0
    
    var over:Bool{
        count == 0
    }
    
    func start(){
        cards = []
        flips = 0
        
        let max = GameModel.rows * GameModel.cols / 2
        for i in 1...max{
            cards.append(Card(state: .closed, number: i))
            cards.append(Card(state: .closed, number: i))
        }
        count = cards.count
        cards.shuffle()
        
    }
    
    init(){
        start()
    }
    
    func card(row: Int, col: Int)-> Card{
        cards[row * GameModel.cols + col]
    }
    
    func toggle(row:Int, col : Int){
        let index = row * GameModel.cols + col
        if index == openCardIndex{
            return
        }
        
        if let oci = openCardIndex{
            let num = cards[oci].number
            if num == cards[index].number{
                cards[index].state = .removed
                cards[oci].state = .removed
                openCardIndex = nil
                count -= 2
            }else{
                cards[oci].state = .closed
                cards[index].state = .open
                openCardIndex = index
                flips += 1
            }
        }else {
            cards[index].state = .open
            openCardIndex = index
            flips += 1
        }
        
        
//        if openCardIndex == nil{
//            cards[index].state = .open
//        }else{
//            let num = cards[openCardIndex!].number
//            if num == cards[index].number{
//                cards[index].state = .removed
//                cards[openCardIndex!].state = .removed
//                openCardIndex = nil
//            }else{
//                cards[openCardIndex!].state = .closed
//                cards[index].state = .open
//                openCardIndex = index
//            }
//        }
//        if cards[index].state == .open{
//            cards[index].state = .closed
//        }
//        else if cards[index].state == .closed{
//            cards[index].state = .open
//        }
//        openCardIndex = index
    }
    
    
}
