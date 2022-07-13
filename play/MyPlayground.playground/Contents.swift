import UIKit
import Foundation

var greeting = "Hello, playground"

let a = 30
a + 20

let arr = [2,3,4,5,6]
//print("h \(arr[4])")

let dic = ["kim" : 1 , "aa":4]

var b:Int = 30
b += 3

let count = dic.count

var arr1 = [1,2,3,2,1]
arr1.sort()
arr1.append(-1)
arr1.sort()

arr1.append(30)

let a2:[CustomStringConvertible] = [1,"2"]

var info = ["a":1,"b":2]
//print(info)

let z = info["a"]!  //!를 이용하여 unwrap함
//print(z)

var 😎 = 30
//print(😎)

let 😱 = "O.M.G."
//😱.count

switch 😎 {
case 10:
    print("no")
case let x where x>=3_0:
    print("yes")
default:
    print("default")
}

var sum = 0
for num in 1...1000{
    sum += num
}

func greet(name:String,day:String) -> String{
    return "Hello \(name) , today is \(day)"
}

let msg1 = greet(name: "tukorea", day: "Monday")

func sum_mul(a:Int, b:Int)->( Int,Int){
    return (a+b, a*b)
}

let x = sum_mul(a: 10, b: 20)
let y = sum_mul(a: 100, b: 102)

var ff = greet


