//
//  main.swift
//  swift_block
//
//  Created by 唯赢 on 2018/5/3.
//  Copyright © 2018年 李立. All rights reserved.
//

import Foundation

// # 闭包 #

// 闭包是可以在你的代码中被传递和引用的功能性独立模块。与Objective-C中的blocks类似,与C的函数指针类似
// 闭包可以捕获和存储定义在起上下文中的任何常量和变量的引用
// 闭包就是将常量变量和逻辑包裹起来所以称为闭包

// 在函数内部声明的函数（内嵌函数），其实是一种特殊的闭包，闭包符合以下三种形式中的一种：
// 1、全局函数是一个有名字但不会捕获任何值的闭包
// 2、内嵌函数是一个有名字且能从上层函数中捕获值的闭包
// 3、闭包表达式是一个轻量级语法所写的可以捕获其上下文中常量或者变量值没有名字的闭包

// 内嵌函数
func testFunc() {
    func log(text: String) {
        print(text)
    }
    
    log(text: "内嵌函数")
}

testFunc()
// 排序函数，闭包的使用
var list = [3, 2, 5, 1]
list.sort { (x, y) -> Bool in
    return x < y
}
print(list)


func compre(_ x: Int, _ y: Int) -> Bool {
    return x > y
}

list.sort(by: compre(_:_:))
print(list)


// 闭包表达式语法
//{ (parameter) -> (return type) in
//    statements
//}

// 定义一个闭包（排序规则）
let sortUsingBlock = {(x:Int, y:Int) -> Bool in return x > y}
var scores = [36, 86, 23, 54, 79, 90, 60]
scores.sort(by: sortUsingBlock) // 对成绩从高到低排序
print(scores)

// ## 闭包表达式语法能够使用常量形式参数、变量形式参数和输入输出形式参数，但不能提供默认值。
// ## 可变形式参数也能使用，但需要在形式参数列表的最后面使用。元组也可被用来作为形式参数和返回类型。
let logBlock = {(_ text: String) -> Void in print(text)}
logBlock("有参数无返回值的闭包")
// 有参数，有返回值的闭包
let addBlock = {(x: Int, y: Int) -> Int in return x + y}
print(addBlock(4, 8))
// 无参数无返回值的闭包
let voidBlock = {() -> Void in print("无参数无返回值的闭包")}
voidBlock()

// 从语境中推断类型
list.sort(by: {x, y in return x > y})
print(list)
// ## 排序闭包是实际参数传递给sort函数，因此Swift可以推断出闭包的形参和返回值类型，所以可以省略形参类型和返回值类型，围绕在形参周围的括号也可以省略
// ## 当把闭包作为行内闭包表达式传递给函数，形式参数类型和返回类型都可以被推断出来。所以说，当闭包被用作函数的实际参数时你都不需要用完整格式来书写行内闭包。


// 尾随闭包
// 如果你需要将一个很长的闭包表达式作为函数最后一个实际参数传递给函数，使用尾随闭包将增强函数的可读性。
// 尾随闭包是一个被书写在函数形式参数的括号外面（后面）的闭包表达式：
func someFunctionThatTakesAClosure(closure:() -> Void) {
    closure()
}

someFunctionThatTakesAClosure {
    print("尾随闭包可以不用写括号!")
}



// 闭包做函数参数
func divf(x: Int, y: Int, resultBlock: (Int) -> Void) -> Void {
    resultBlock(x / y)
}

divf(x: 6, y: 2) { (result) in
    print("result = \(result)")
}


// map(_:) 方法中的尾随闭包
let numbers = [2, 3, 6]
let strings = numbers.map { (number) -> String in
    return String(number)
}
print("map(_:)方法的尾随闭包：\(strings)")


// 捕获值
// 闭包能够从上下文中捕获已被定义的常量和变量，即使定义这些常量和变量的作用域不存在了，依然能够在闭包中修改函数体中的这些值。
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningCount = 0
    let block = {() -> Int in
        runningCount += 1
        return runningCount
    }
    
    return block
}

let block = makeIncrementer(forIncrement: 0)
let runningCountResult = block()
print("runningCountResult = \(runningCountResult)") // 1
print("runningCountResult = \(block())")    // 2
print("runningCountResult = \(block())")    // 3
print("runningCountResult = \(block())")    // 4

// 闭包是引用类型
// 无论你什么时候赋值一个函数或者闭包给常量或者变量，你实际上都是将常量和变量设置为对函数和闭包的引用。

// 逃逸闭包
// 当一个闭包作为一个实际参数传递给一个函数时，我们就说这个闭包逃逸了，因为它可以在函数返回之后被调用。
// 当你声明一个接受闭包作为形式参数的函数时，你可以在形式参数前写 @escaping 来明确闭包是允许逃逸的。
// 逃逸闭包的理解：https://www.jianshu.com/p/6c6ab0f67308
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) -> Void {
    
}

// 自动闭包
// 闭包作为参数传递给函数时，可以将闭包定义为自动闭包（使用关键字@autoclosure）。
// 这样传递参数时，可以直接传递一段代码（或者一个变量、表达式），系统会自动将这段代码转化成闭包。
// 需要注意：过度使用 @autoclosures 会让你的代码变得难以理解。

func someFunctionWithAutoclosure(completionHandler: @autoclosure () -> Void) -> Void {
    completionHandler()
}

someFunctionThatTakesAClosure(closure: { print("自动闭包") })

// 如果你想要自动闭包允许逃逸，就同时使用 @autoclosure 和 @escaping 标志。
func someFunctionWithAutoclosureAndEscaping(completionHandler: @autoclosure @escaping () -> Void) -> Void {
    // 逃逸和自动闭包
}





