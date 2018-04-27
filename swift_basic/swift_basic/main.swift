//
//  main.swift
//  swift_basic
//
//  Created by 唯赢 on 2018/4/23.
//  Copyright © 2018年 李立. All rights reserved.
//

import Foundation

// Hello world
print("hello lili, hello world")
print("This is a swift program.")

// # 常量和变量 #

// 声明常量和变量
// 1.使用let来声明常量
let maxCount = 10
print("maxCount is \(maxCount)")
// 2.使用var来声明变量
var currentLoginAttempt = 1
print("currentLoginAttempt is \(currentLoginAttempt)")
// 使用var声明的常量可以改变值，但使用let声明的常量不能改变值
currentLoginAttempt = 2
print("update -- currentLoginAttempt is \(currentLoginAttempt)")
// 注意：在你的代码中，如果存储的值不会改变，请用 let 关键字将之声明为一个常量。只有储存会改变的值时才使用变量。

// 类型标注
// 你可以在声明一个变量或常量的时候提供类型标注，来明确变量或常量能够储存值的类型。
// 添加类型标注的方法是在变量或常量的名字后边加一个冒号，再跟一个空格，最后加上要使用的类型名称。
let welcomeMessage: String = "welcome to chengdu."
print("welcomeMessage: \(welcomeMessage)")
var a: Int
var b: Double
var c: Character
a = 100
b = 200
c = "c"
// 可以在定义变量的一行中定义多个相同类型变量，最后声明类型的时候，在最后一个变量的后边使用":"隔开
var red, green, blue: Double

// Swift声明变量和常量可以使用Unicode字符，也就是任意字符
// 常量和变量的名字不能包含空白字符、数学符号、箭头、保留的（或者无效的）Unicode 码位、连线和制表符。
// 也不能以数字开头，尽管数字几乎可以使用在名字其他的任何地方。
var 登陆次数 = 50
print("登陆次数 = \(登陆次数)")
let 登陆次数上限值 = 100
print("登陆次数上限值 = \(登陆次数上限值)")

// 整数范围
let maxIntValue = UInt8.max     // 8位无符号整数的最大值 2^8 - 1
let minIntValue = UInt8.min
print("max \(maxIntValue) \nmin \(minIntValue)")

// 数值字面量
let decimalInteger = 19
let binaryInteger = 0b10100010
let octalInteger = 0o537624
let hexadecimalInteger = 0x7fff0987

// 类型溢出检测，编译不过
//let tooBig: Int8 = Int8.max + 1
//print("tooBig = \(tooBig)")

// 类型不相同的变量不能做运算
let twoThousand: UInt16 = 2000
let one: UInt8 = 1
let twoThousandAndOne: UInt16 = twoThousand + UInt16(one)   // 将one变量做类型转换
print("twoThousandAndOne is \(twoThousandAndOne)")

// 类型别名
typealias AudioSample = UInt16
let sample: AudioSample = 1
print("sample = \(sample)")

// 布尔类型，逻辑类型
var isInstall = false
print("isIntall = \(isInstall)")

// 元组
// 元组把多个值合并成单一的复合型的值，元组内的值可以是任意类型。
let httpError: (Int, String) = (404, "Not Found")
let (code, msg) = httpError
print("error code = \(code)")
print("error msg = \(msg)")
// 可以在定义元组的时候指定名称
let httpReponse = (errorCode: 404, errorMsg: "Not Found");
// 按照名称访问元组内容
print("code = \(httpReponse.errorCode)")
print("msg = \(httpReponse.errorMsg)")
// 按照下标访问
print("code = \(httpReponse.0)")
print("msg = \(httpReponse.1)")

// 可选项
let possobleNumber = "1000"
let convertedNumber = Int(possobleNumber)
//print("convertedNumber = \(convertedNumber)")

// If 语句以及强制展开
// 你可以利用 if 语句通过比较 nil 来判断一个可选中是否包含值。利用相等运算符 （ == ）和不等运算符（ != ）。
// 如果一个可选有值，他就“不等于” nil
if convertedNumber != nil {
    // 如果确定可选有值，就可以使用 ! 展开
    // 注意：使用 ! 来获取一个不存在的可选值会导致运行错误，在使用!强制展开之前必须确保可选项中包含一个非 nil 的值。
    print("convertedNumber = \(convertedNumber!)")
} else {
    print("convertedNumber is nil")
}

// 可选项绑定
// 可以使用可选项绑定来判断可选项是否包含值，如果包含就把值赋给一个临时的常量或者变量。
// 可选绑定可以与 if 和 while 的语句使用来检查可选项内部的值，并赋值给一个变量或常量。
if let tempValue = Int(possobleNumber) {
    print("tempValue = \(tempValue)")   // tempValue 早已被可选内部的值进行了初始化，所以这时就没有必要用 ! 后缀来获取里边的值
} else {
    print("可选项为nil")
}

// 隐式展开可选项
// 原因需求：有时在一些程序结构中可选项一旦被设定值之后，就会一直拥有值。在这种情况下，就可以去掉检查的需求，也不必每次访问的时候都进行展开，因为它可以安全的确认每次访问的时候都有一个值。
//let name: String? = "Lili"
//print("name  = \(name!)")
// 如果你在隐试展开可选项没有值的时候去获取值，或导致崩溃，这和普通可选项后面加一个叹号一样的效果,所以隐式展开可选项一定要确保有值
// 不要在一个变量在将来要变成nil的情况下使用隐式展开可选项，否则出现错误
let name: String! = "my name is lili";
//print("name = \(name!)")
let tempName: String = name;
print("tempName = \(tempName)")

// 断言
let age = -3
//assert(age > 0, "age不能为负数")




