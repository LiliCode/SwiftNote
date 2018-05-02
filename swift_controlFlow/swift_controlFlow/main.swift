//
//  main.swift
//  swift_controlFlow
//
//  Created by 唯赢 on 2018/4/28.
//  Copyright © 2018年 李立. All rights reserved.
//

import Foundation

// # 控制流程语句 #

// for-in 循环
// for-in循环遍历数组
let books = ["The Swift Programming Language", "数据结构", "高等数学"]
for bookName in books {
    print(bookName)
}

// for-in循环遍历字典
let persons = ["lili":"18281863522", "CMCC":"10086"]
for (name, tel) in persons {    // 在遍历字典时，每一个元素返回的是一个(key, value) 的元组
    print(name + ": " + tel)
}

// for-in循环可以遍历数字区间
for index in 0...5 {
    print("current index: \(index)")
}

for index in 2..<5 {
    print("index = \(index)")
}

// fon-in循环求阶乘
var factorial = 1
for index in 1...5 {
    factorial *= index;
}
print("factorial is \(factorial)")

// for-in循环求1~100的和
var count = 0
for index in 1...100 {
    count += index
}
print("1~100的和为:\(count)")

// 使用 stride(from:to:by:) 函数来跳过不想要的标记
let minutesInterval = 5
for tickMark in stride(from: 0, to: 60, by: minutesInterval) {
    print(tickMark)
}

// while循环
// 分为当型循环和直到型循环

// 直到型循环: 先判断条件是否成立，然后在执行循环体，有可能一次都不执行循环体
//while condition {
//
//}

// 当型循环: 至少执行一次循环体，先执行循环体，然后在判断条件
//repeat {
//
//} while condition

// 使用while循环计算阶乘
var fac = 1
var index = 1
while index <= 5 {
    fac *= index
    index += 1
}
print("while循环计算5的阶乘：\(fac)")

// 使用repeat-while循环计算阶乘
fac = 1
index = 1
repeat {
    fac *= index
    index += 1
} while index <= 5
print("repeat-while循环计算5的阶乘：\(fac)")


// 条件语句

// if语句 - (代码略)
// if、if-else、if - else if - else 条件判断都可以不用添加括号

// switch多分支语句-(与C的switch语句相比较，Swift的switch功能非常强大)
// switch 语句会将一个值与多个可能的模式匹配。然后基于第一个成功匹配的模式来执行合适的代码块。
// switch 语句代替 if 语句提供了对多个潜在状态的响应。

// switch语句的普通用法
// Swift中的switch语句是没有隐式贯穿的，不需要添加break
let number = 1
switch number {
case 1:
    print("number is \(number)")
case 2:
    print("number is \(number)")
default:
    print("没有你想要的案例")
}

// switch区间匹配
// switch情况的值可以在一个区间中匹配。
let score = 95
switch score {
case 0..<60:
    print("不及格!!!")
case 60...70:
    print("及格")
case 70...80:
    print("良好")
case 90...100:
    print("优秀")
default:
    print("没有等级!")
}

// 元组：你可一使用元组来匹配switch中的多个值
// 每个元组都可以与不同的值或者区间值来匹配，使用'_'来代表可以匹配任意值
// 与 C 不同，Swift 允许多个 switch 情况来判断相同的值。
let somePoint = (1, 3)
switch somePoint {
case (0, 1):
    print("元组匹配：\(somePoint)")
case (_, 1):
    print("元组匹配：\(somePoint)")
//case (1, 3):
//    print("元组匹配：\(somePoint)")
case (0...3, 3..<6):
    print("元组区间匹配：\(somePoint)")
default:
    print("没有你相匹配的元组")
}

// switch 值绑定
// switch 情况可以匹配到的值临时绑定为一个常量或者变量
let anotherPoint = (2, 5)
switch anotherPoint {
case (let x, 5):
    print("值绑定：x = \(x)")
case (3, let y):
    print("值绑定：y = \(y)")
default:
    print("值绑定：没有匹配到值")
}
// case (let x, 5):
// 值绑定：元组anotherPoint里面匹配值，会匹配到y = 5的值，然后将anotherPoint的x赋值给临时变量x
// case (3, let y):
// 值绑定：元组anotherPoint里面匹配值，会匹配到x = 3的值，然后将anotherPoint的y赋值给临时变量y


// switch where -> 特别的一个特性
let yetAnotherPoint = (6, 2)
switch yetAnotherPoint {
case (let x, 3) where x > 4:
    print("Switch Where: x = \(x)")
case (3, let y) where y < 4:
    print("Switch Where: y = \(y)")
default:
    print("where没有匹配到值")
}


// switch case复合情况
// 多个 switch 共享同一个函数体的多个情况可以在 case 后写多个模式来复合，在每个模式之间用逗号分隔。
// 如果任何一个模式匹配了，那么这个情况都会被认为是匹配的。
let someCharacter = "e"
switch someCharacter {
case "h", "e", "l", "o":
    print("复合情况：\(someCharacter)")
case "w", "q":
    print("复合情况：\(someCharacter)")
default:
    print("复合情况没有匹配到值")
}
// case "h", "e", "l", "o": 在此case中，someCharater匹配到了"e"，所以就会执行当前case
// 同样复合情况也可以进行值绑定
switch yetAnotherPoint {
case (let v, 2), (6, let v):
    print("复合情况的值绑定：\(v)")
default:
    print("复合情况的值绑定：没有匹配")
}


// 控制转移语句
// continue: 在循环中使用，告诉循环体结束本地循环开始进行下一次循环（跳过本地循环而不是结束循环）。
// break: 在循环中使用，跳出循环体结束剩下的循环；在switch-case中使用，提前结束switch-case
// fallthrough: 在switch-case中，使case具备C语言的穿透效果
// return: 函数返回值，结束函数
// throw: 抛出函数错误

// 语句标签
// https://www.jianshu.com/p/367ccb3303a4


// 提前退出
// guard 语句
// 类似if语句，基于布尔值表达式来执行语句。
// 使用 guard 语句来要求一个条件必须是真才能执行 guard 之后的语句。
// 与 if 语句不同， guard 语句总是有一个 else 分句—— else 分句里的代码会在条件不为真的时候执行。
func _sqrt(x:Double) -> Double {
    guard x >= 0 else {
        print("负数没有平方根!")
        return 0;
    }
    
    return sqrt(x);
}
// 执行函数
let a:Double = -4
print("_sqrt(\(a)) = \(_sqrt(x: a))")

// 检测API的可用性
if #available(macOS 10.13, *) {
    print("macOS 10.13")
} else {
    print("macOS 版本不对")
}













