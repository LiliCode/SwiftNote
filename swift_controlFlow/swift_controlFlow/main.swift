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




















