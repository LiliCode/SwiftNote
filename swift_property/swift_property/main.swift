//
//  main.swift
//  swift_property
//
//  Created by 唯赢 on 2018/5/8.
//  Copyright © 2018年 李立. All rights reserved.
//

import Foundation

// # 类和结构体 -- 属性 #

// 属性可分为存储属性和计算属性

// 属性可以将值与特定的类、结构体或者是枚举联系起来。存储属性会存储常量或变量作为实例的一部分，反之计算属性会计算（而不是存储）值。
// 计算属性可以由类、结构体和枚举定义。存储属性只能由类和结构体定义。


// 存储属性
// 在其最简单的形式下，存储属性是作为一个特定类和结构体实例的一部分变量或常量

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

var fixedRange: FixedLengthRange = FixedLengthRange(firstValue: 2, length: 9)
fixedRange.firstValue = 8
//fixedRange.length = 4   // 语法错误，因为使用let声明的是一个常量，常量值不可修改

// 常量结构体实例的存储属性
// 如果使用let声明的创建的结构体，不能修改属性值，即使属性是一个变量(var声明的属性)也不可修改
let range = FixedLengthRange(firstValue: 8, length: 7)
//range.firstValue = 3

// 延迟存储属性（懒加载）
// 延迟存储属性的初始值在其第一次使用时才进行计算。你可以通过在其声明前标注 lazy 修饰语来表示一个延迟存储属性。
// ## 注意: 你必须把延迟存储属性声明为变量（使用 var 关键字），因为它的初始值可能在实例初始化完成之前无法取得。常量属性则必须在初始化完成之前有值，因此不能声明为延迟。
// ## 注意: 如果被标记为 lazy 修饰符的属性同时被多个线程访问并且属性还没有被初始化，则无法保证属性只初始化一次。
class Person {
    lazy var name = "lili"  // name在首次使用的时候就会初始化成"lili"
}

var p = Person()
print(p.name)


// 计算属性（相当于Objc重写get、set方法）
// 除了存储属性，类、结构体和枚举也能够定义计算属性，而它实际并不存储值。相反，他们提供一个读取器和一个可选的设置器来间接得到和设置其他的属性和值。

struct Point {
    var x: Double = Double()
    var y: Double = Double()
}

struct Size {
    var width: Double = Double()
    var height: Double = Double()
}

struct Rect {
    var origin: Point = Point(x: 0.0, y: 0.0)
    var size: Size = Size(width: 0.0, height: 0.0)
    
    var center: Point {
        // 重写get
        get {
            return Point(x: origin.x + size.width / 2.0, y: origin.y + size.height / 2.0)
        }
        
        // 重写set
        set(point) {
            origin.x = point.x - size.width / 2.0
            origin.y = point.y - size.height / 2.0
        }
        
        // 简写设置器（setter）声明
        // 如果一个计算属性的设置器没有为将要被设置的值定义一个名字，那么他将被默认命名为 newValue 。
//        set {
//            origin.x = newValue.x - size.width / 2.0
//            origin.y = newValue.y - size.height / 2.0
//        }
    }
}

var frame = Rect(origin: Point(x: 3.0, y: 5.9), size: Size(width: 40, height: 70))
frame.center = Point(x: 50, y: 60)
print(frame)


// 只读属性
// 一个有读取器但是没有设置器的计算属性就是所谓的只读计算属性。只读计算属性返回一个值，也可以通过点语法访问，但是不能被修改为另一个值。
// 你必须用 var 关键字定义计算属性——包括只读计算属性——为变量属性，因为它们的值不是固定的。

struct Cuboid {
    var widht = 0.0, height = 0.0, depth = 0.0
    // 只读属性
    var volume: Double {
        return widht * height * depth
    }
}

var cub = Cuboid(widht: 20, height: 30, depth: 10)
print("立方体的体积：\(cub.volume)m³")


// 属性观察者
// 属性观察者会观察并对属性值的变化做出回应。每当一个属性的值被设置时，属性观察者都会被调用，即使这个值与该属性当前的值相同。
// 你不需要为非重写的计算属性定义属性观察者，因为你可以在计算属性的设置器里直接观察和相应它们值的改变。

struct StepCounter {
    var totalSteps: Int = 0 {   // 属性观察
        willSet {
            newValue > totalSteps ? print("新值大于旧值") : print("旧值大于新值")
        }
        
        didSet {
            print("设值完成: \(totalSteps)")
        }
    }
}

var counter = StepCounter(totalSteps: 8)
counter.totalSteps = 2

// ## 注意
// 如果你以输入输出形式参数传一个拥有观察者的属性给函数， willSet 和 didSet 观察者一定会被调用。
// 这是由于输入输出形式参数的拷贝入拷贝出存储模型导致的：值一定会在函数结束后写回属性。

func someFunction(stepCounter: inout StepCounter) -> Void {
    stepCounter.totalSteps = 90
}

someFunction(stepCounter: &counter)

// ## 注意: 全局常量和变量永远是延迟计算的，与延迟存储属性有着相同的行为。不同于延迟存储属性，全局常量和变量不需要标记 lazy 修饰符。




// 类型属性 (相当于Objc类方法一个道理，只属于这个类，不属于对象)
// 实例属性是属于特定类型实例的属性。每次你创建这个类型的新实例，它就拥有一堆属性值，与其他实例不同。
//
// 你同样可以定义属于类型本身的属性，不是这个类型的某一个实例(对象)的属性。这个属性只有一个拷贝，无论你创建了多少个类对应的实例。这样的属性叫做类型属性。

// 使用 static 关键字来开一类型属性。对于类类型的计算类型属性，你可以使用 class 关键字来允许子类重写父类的实现。


struct SomeStructure {
    static var sortedTypeProperty = "some value"
}

// 类属性只能有类名使用点语法来访问, 因为类属性不属于对象
print("类属性：\(SomeStructure.sortedTypeProperty)")





















