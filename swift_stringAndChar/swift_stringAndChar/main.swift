//
//  main.swift
//  swift_stringAndChar
//
//  Created by 唯赢 on 2018/4/24.
//  Copyright © 2018年 李立. All rights reserved.
//

import Foundation

// # 字符与字符串 #

// 字符串
// Swift中的字符串使用String类型来表示
let string: String = "Hello World"
// Swift中的字符串连接可以使用"+"运算符
var appdingString = string + "," + " " + "你好 世界"
print(appdingString)
// 多行字符串使用"""
let multilLineString = """
在这个多行格式中，字符串字面量包含了双引号包括的所有行。
字符串起始于三个双引号（ \""" ）之后的第一行，结束于三个双引号（ \""" ）之前的一行，
也就是说双引号不会开始或结束带有换行。下面的两个字符串是一样的
"""
print(multilLineString)

// 初始化一个字符串
// 通过isEmpty属性检查字符串是否为空
let emptyString = ""
let anotherEmptyString = String()
if (emptyString.isEmpty && anotherEmptyString.isEmpty) {
    print("空字符串")
}

// 字符串的可变性
// 只有用var声明的字符串变量才能修改，使用let声明的字符串不能被修改
// Objective-C中只能是NSString和NSMutableString来明确字符串是否可以被修改
var mutableString = "mutable"
mutableString += "String"
print(mutableString)

// Swift中的字符串是值类型。每一次String的值传递都是一次值的复制。

// 操作字符

// 可以通过for-in循环遍历字符串
for char in mutableString {
    print(char)
}

// Character 字符变量
let character: Character = "!"
// 使用字符数组初始化字符串
let chars:[Character] = ["H", "e", "l", "l", "o"]
let charString = String(chars)
print(charString)   // 输出：hello
// 使用字符类型初始化一个字符串
print(String(character))  // 输出：!

// 字符串插值
// 字符串插值是一种从混合常量、变量、字面量和表达式的字符串字面量构造成一个新的字符串的方法。
// 每一个你插入到字符串字面量的元素都要被一对圆括号包裹，然后使用反斜杠前缀
let insertString = "插入字符串:\(charString) \(mutableString)"
print(insertString)

// Unicode 字符串字面量中的特殊字符
// 任意的 Unicode 标量，写作 \u{n}，里边的 n是一个 1-8 个与合法 Unicode 码位相等的16进制数字。
print("\u{2665}")

// 字符串索引
let greeting = "Greenting!"
print(greeting[greeting.index(before: greeting.endIndex)])

// 遍历字符串获取下标
for index in greeting.indices {
    print(greeting[index])
}

// 插入和删除字符
var insert_string = "insertString"
insert_string.insert("_", at: insert_string.startIndex)
print(insert_string)
insert_string.insert("!", at: insert_string.index(insert_string.startIndex, offsetBy: 13))
print(insert_string)
insert_string.remove(at: insert_string.startIndex)
insert_string.remove(at: insert_string.index(before: insert_string.endIndex))
print(insert_string)

// 子字符串
var substring = "substring_"
var subStr = substring[..<substring.index(before: substring.endIndex)]
var newString = String(subStr)
print(newString)

// 字符串比较
print(substring.hasPrefix("sub"))
print(substring.hasSuffix("_"))

if (subStr == substring) {
    print("subStr == substring")
} else {
    print("subStr != substring")
}






