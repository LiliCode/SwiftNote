//
//  main.swift
//  swift_operation
//
//  Created by 唯赢 on 2018/4/24.
//  Copyright © 2018年 李立. All rights reserved.
//

import Foundation

// # 基本运算符 #

// 溢出操作符
// Swift中的 + - * / 等运算符是不允许算术溢出的，如果你要使用溢出就可以用溢出操作符&
// 例如加法溢出：
var sum = UInt8.max &+ 1    // 在加号前面添加一个'&'就可以不做溢出检测
print("sum is \(sum)")      // 结果是0，UInt8表示8位无符号整型数字，他的最大范围的二进制数:11111111,做+1操作，就变成了1 0000 0000,按照8位截取就变成了0
// + 运算符支持字符串的拼接
let helloWorld = "hello" + " " + "world"
print(helloWorld)

// 合并空值运算符 ?? (a ?? b)，如果a不为空，就返回a,否则就返回b
let tmp = UInt("Hello World")
let b: UInt = 0
var a = tmp ?? b
//var a = tmp != nil ? tmp! : b // 效果同上
print(a)

// 测试 - 用户选择颜色
let defaultColorName = "redColor"
var userDefineColorName: String?    // 可选项  - 用户自定义的颜色
var colorName = userDefineColorName ?? defaultColorName // 如果用户没有自定义颜色，就显示默认的颜色
print(colorName)

// 区间运算符
// 1.闭区间运算符(a...b) 定义了从a到b的一组范围，包含了a、b的值，但不能超出a、b的值
// 2.半开区间运算符(a ..< b) 定义了从a到b的一组范围，包含了a的值但小于b

// test
let array = ["lili", "jax", "jac", "tom"]
for i in 0 ..< array.count {
    print(array[i])
}

// 单侧区间
for name in array[...2] {
    print(name)
}













