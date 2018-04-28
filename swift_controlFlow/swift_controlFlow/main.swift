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












