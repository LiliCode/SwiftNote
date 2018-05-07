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















