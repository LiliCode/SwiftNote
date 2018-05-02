//
//  main.swift
//  swift_func
//
//  Created by 唯赢 on 2018/5/2.
//  Copyright © 2018年 李立. All rights reserved.
//

import Foundation

// # 函数 #

// 定义：函数是一个独立的代码块，用来执行特定的任务。
// 通过给函数一个名字来定义它的功能，并在需要的时候，通过这个名字来调用函数的执行任务。

// 定义一个函数：
// 使用关键字func来声明一个函数
func addf(x:Double, y:Double) -> Double {
    return x + y
}
// 执行函数
var sum = addf(x: 2, y: 9)
print("sum is \(sum)")
// addf是一个双精度浮点数的加法运算函数
// 也可以使用函数嵌套调用：
print(addf(x: 3, y: 5))

// 函数的形式参数和返回值

// 无参函数

/// 输出一个Hell World!的函数
func helloWorld() {
    print("Hello World!")
}
// 调用
helloWorld()    // 此函数无参数无返回值

// 多参数函数

// 函数可以有一个或多个参数, 写在圆括号内，使用","分隔

/// 定义一个两个浮点数相乘的函数
///
/// - Parameters:
///   - x: 前操作数
///   - y: 后操作数
/// - Returns: 返回乘法结果
func fmul(x:Double, y:Double) -> Double {
    return x * y
}

// 调用
print(fmul(x: 5, y: 8))     // x,y 参数名称

// 无返回值函数

/// 打印名称
///
/// - Parameter name: 名称字符串
func showName(name: String) {
    print(name)
}
// 无返回值函数，不需要在函数声明后面添加"->"或者返回类型
// 其实严格了来讲该函数是有返回值的，只不过返回的是Void,他其实是一个空的元组，相当于没有元素的元组，可以写作()。
showName(name: "my name is lili")

// # 注意：函数返回值是可以忽略不使用的，但是在函数体中，如果有返回值是必须要返回的。

// 多返回值函数
// 为了让函数返回多个值，可以使用元组类型作为返回值

/// 查找最大最小值（最值）的函数
///
/// - Parameter list: 数据列表
/// - Returns: 返回最大最小值的元组
func limitValue(list:[Double]) -> (max:Double, min:Double)? {
    if list.isEmpty {
        return nil;
    }
    
    var max:Double = list.first!, min:Double = list.first!
    for value in list {
        if max < value {
            max = value
        } else if min > value {
            min = value
        }
    }
    
    return (max, min)
}

if let limValue = limitValue(list: [5.1, 3.5, 2.9, 4.8, -2.1, 8.2, -3.9, 3.0, 4.1]) {
    print("max is \(limValue.max), min is \(limValue.min)")
} else {
    print("空列表")
}

// 函数参数标签和形式参数名
// 每一个函数参数标签都包含实际参数标签和参数名。实际参数标签在调用的时候，每一个实际参数前面都要写实际参数标签。形式参数名用在函数的实现当中。
// 默认情况下，形式参数使用它们的形式参数名作为实际参数标签
func someFunction(firstParameterName: Int) {
    
}

someFunction(firstParameterName: 0)    // firstParameterName 就是实际参数标签（默认）

// 知道实际参数标签
func someFunction(argLabel firstParameterName: Int) {
    
}

someFunction(argLabel: 0)   // argLabel 就是指定的参数标签

// ## 实际参数标签的使用能够让函数的调用更加明确，更像是自然语句，同时还能提供更可读的函数体并更清晰地表达你的意图。

// 省略实际参数标签 - 调用函数时，看不到标签
// 在默认的参数标签前面添加 "_" 就可以省略实际参数标签
func someFunction(_ firstParameterName: Int) {
    
}

someFunction(0) // 此时标签已经省略


// 默认形式参数
func someFunction(parameter: Int = 0) {
    print("默认参数：\(parameter)")
}

someFunction(); // 指定了默认参数值，在调用函数时可以不用赋值


// 可变参数
func sum(_ args: Double...) -> Double {
    var _sum = Double(0)
    for number in args {
        _sum += number
    }
    
    return _sum
}

print(sum(1.9, 2.0, 3.1))


// 输入输出形式参数
// 一般的形式参数的改变只对函数内部起作用，在函数外部就无效，要想在函数内部修改形式参数的值，在外部有效，就需要将参数声明成输入输出(inout)参数
// 在形参名称类型前面添加关键字 inout ，就可以将参数定义成inout参数
// 类似C语言中的指针变量做函数参数。
func opposite(_ number: inout Int) {    // 求相反数
    number = -number
}

var number = -9
opposite(&number)   // 传入number变量的地址
print("number的相反数：\(number)")

// 类似C指针操作
//void c_opposite(int *number) {
//    *number = -*number;
//}
//
//int num = 9;
//c_opposite(&num);
//int *pNum = &num;
//c_opposite(pNum);
//printf("num = %d\n", num);



// 函数类型
// 每一个函数都有一个特定的函数类型，它由形式参数类型，返回类型组成。

//举个栗子：
//func addTwoInts(_ a: Int, _ b: Int) -> Int {
//    return a + b
//}
//func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
//    return a * b
//}

//func addTwoInts(_ a: Int, _ b: Int) -> Int {
//    return a + b
//}
//
//func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
//    return a * b
//}
//上边的栗子定义了两个简单的数学函数 addTwoInts和 multiplyTwoInts 。这两个函数每个传入两个 Int值，返回一个 Int值，就是函数经过数学运算得出的结果。

//这两个函数的类型都是 (Int, Int) -> Int 。也读作：
//“有两个形式参数的函数类型，它们都是 Int类型，并且返回一个 Int类型的值。”

//下边的另外一个栗子，一个没有形式参数和返回值的函数。

//func printHelloWorld() {
//    print("hello, world")
//}
//
//func printHelloWorld() {
//    print("hello, world")
//}
//这个函数的类型是 () -> Void，或者 “一个没有形式参数的函数，返回 Void。”



// 使用函数类型
// 类似C语言的函数指针

// 例如求相反数函数
var a = 11
var oppositeFunction: (inout Int) -> Void = opposite(_:)
oppositeFunction(&a)
print("函数类型：a 的相反数\(a)")

// 使用无参函数类型
var noParameterFunc: () -> Void = helloWorld
noParameterFunc()

// 函数类型作为返回类型
// 类似C语言返回函数指针的函数
func _log(_ string:String) -> (String) -> Void {
    print(string)
    return showName(name:)
}

var showNameFunc = _log("The swift propramming language")   // 该函数返回一个 (String) -> Void 的函数类型
showNameFunc("lili-2018.05.02")     // 调用返回的函数类型


// 函数类型做参数,相当于C函数指针做参数（用于回调），Swift中一般不会这么用，因为Swift引入了闭包
// 例如：
// 输出日志函数
func __log(_ string: String) {
    print(string)
}

// 除法函数
func divf(x: Double, y: Double, info:(String) -> Void) -> Double? {
    guard y != Double(0) else {
        info("除数不能为0")
        return nil
    }
    
    return x / y
}

if let divValue = divf(x: 8, y: 4, info: __log(_:)) {   // 传入函数类型：__log(_:)，相当于C函数指针
    print("divValue is \(divValue)")
}


// 内嵌函数 - (函数嵌套定义，C语言是不支持的)
// 使用内嵌函数重写除法函数
func fdiv(x: Double, y: Double) -> Double? {
    guard y != Double(0) else {
        func div_log(_ string: String) {
            print(string)
        }
        div_log("内嵌函数重写除法函数：除数不能为0")
        return nil
    }
    
    return x / y
}

if let result = fdiv(x: 12, y: 0) {
    print("内嵌函数重写除法函数：\(result)")
}





