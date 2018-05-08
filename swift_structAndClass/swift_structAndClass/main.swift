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
//    init(x: Double, y: Double) {
//        self.x = x
//        self.y = y
//    }
}

class Person: NSObject {
    var name: String = String()
    var email: String = String()
    
    public func info() -> String? {
        return name + " " + email;
    }
    
    deinit {
        print("Person对象销毁")
    }
}

let p = Point(x: 3.4, y: 9.3)   // 使用默认初始化器创建结构体对象
print("x = \(p.x) y = \(p.y)")
let person = Person()           // 使用默认的初始化器创建对象
person.name = "Lili"
person.email = "lili2011050508@163.com"
if let info = person.info() {
    print(info)
}

// 类和结构体都可以使用点语法访问属性
// 所有的结构体都有一个自动生成的成员初始化器，你可以使用它来初始化新结构体实例的成员属性。


// 结构体和枚举是值类型
// 值类型是一种当它被指定到常量或者变量，或者被传递给函数时会被拷贝的类型。
// 其实，在之前的章节中我们已经大量使用了值类型。实际上，Swift 中所有的基本类型——整数，浮点数，布尔量，字符串，数组和字典——都是值类型，并且都以结构体的形式在后台实现。
// Swift 中所有的结构体和枚举都是值类型，这意味着你所创建的任何结构体和枚举实例——和实例作为属性所包含的任意值类型——在代码传递中总是被拷贝的。

let center = Point(x: 40, y: 40)
var position = center
position.x = 0
print("center = (\(center.x), \(center.y)) position = (\(position.x), \(position.y))")

// 类是引用类型
// 不同于值类型，引用类型在被赋值到一个常量或者是一个变量或者本身传递到一个函数它是不会被拷贝的。
var jac: Person = person
jac.name = "jac"
print("jac.name = \(jac.name)")
print("person.name = \(person.name)")
// 输出：
// jac.name = jac
// person.name = jac
// jac变量只是指向了person的地址，只是名字不同摆了


// 特征运算符
// 因为类是引用类型，在后台有可能有很多常量和变量都是引用到了同一个类的实例。
// 有时候找出两个常量或者变量是否引用自同一个类实例非常有用，为了允许这样，Swift提供了两个特点运算符：
// 相同于 ( ===)
// 不相同于( !==)

if person === jac {
    print("person 和 jac 引用自同一对象")
} else {
    print("person 和 jac 不是同一对象")
}

/*
 类和结构体之间的选择
 类和结构体都可以用来定义自定义的数据类型，作为你的程序代码构建块。
 
 总之，结构体实例总是通过值来传递，而类实例总是通过引用来传递。这意味着他们分别适用于不同类型的任务。当你考虑你的工程项目中数据结构和功能的时候，你需要决定把每个数据结构定义成类还是结构体。
 
 按照通用准则，当符合以下一条或多条情形时应考虑创建一个结构体：
 
 结构体的主要目的是为了封装一些相关的简单数据值；
 当你在赋予或者传递结构实例时，有理由需要封装的数据值被拷贝而不是引用；
 任何存储在结构体中的属性是值类型，也将被拷贝而不是被引用；
 结构体不需要从一个已存在类型继承属性或者行为。
 合适的结构体候选者包括：
 
 几何形状的大小，可能封装了一个 width属性和 height属性，两者都为 double类型；
 一定范围的路径，可能封装了一个 start属性和 length属性，两者为 Int类型；
 三维坐标系的一个点，可能封装了 x , y 和 z属性，他们都是 double类型。
 在其他的情况下，定义一个类，并创建这个类的实例通过引用来管理和传递。事实上，大部分的自定义的数据结构应该是类，而不是结构体。
 */


// 字符串，数组和字典的赋值与拷贝行为
// Swift 的 String , Array 和 Dictionary类型是作为结构体来实现的，这意味着字符串，数组和字典在它们被赋值到一个新的常量或者变量，亦或者它们本身被传递到一个函数或方法中的时候，其实是传递了拷贝。
// 这种行为不同于基础库中的 NSString, NSArray和 NSDictionary，它们是作为类来实现的，而不是结构体。 NSString , NSArray 和 NSDictionary实例总是作为一个已存在实例的引用而不是拷贝来赋值和传递。










