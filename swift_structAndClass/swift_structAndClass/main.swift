//
//  main.swift
//  swift_structAndClass
//
//  Created by 唯赢 on 2018/5/8.
//  Copyright © 2018年 李立. All rights reserved.
//

import Foundation


// # 类和结构体 #


// Swift中的结构体和类有很多共同之处：
// 1、可定义属性
// 2、可定义方法
// 3、可定义下标脚本使用下标语法访问值
// 4、可定义初始化器
// 5、可以使用扩展来扩展当前结构体没有的功能
// 6、可以遵循协议

// 区别：

// 结构体所没有的功能
// 1、类可以使用继承
// 2、类型转换允许你在运行时检查和解释一个类实例的类型
// 3、反初始化器允许一个类实例释放任何所被分配的资源
// 4、引用计数

// 注意：结构体类型是通过值复制来传递，并且不会使用引用计数


// 语法:
// 使用struct定义一个结构体
// 使用class定义一个类

//struct <#name#> {
//    <#fields#>
//}

//class <#name#>: <#super class#> {
//    <#code#>
//}

// 无论你在何时定义类或者结构体你都是在定义一个新的类型
// 规范：类名和结构体名请使用驼峰命名法，并且首字母大写，例如：UIViewController、NSObject
// 属性和函数名称首字母小写，例如：var frameRate、  func someFunction() -> Void {}

// 类、结构体定义示例

struct Point {
    var x: Double
    var y: Double
    // 初始化器
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
}

class Person: NSObject {
    var name: String = String()
    
}









