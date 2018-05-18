//
//  main.swift
//  swift_扩展
//
//  Created by 唯赢 on 2018/5/18.
//  Copyright © 2018年 李立. All rights reserved.
//

import Foundation

// # 扩展 #

// 扩展是为现有类、结构体、枚举类型火协议添加新功能。这也包括为无访问权限的源代码扩展类型的能力。
// 扩展和Objective-C的分类类似，不同的是，分类有有名分类和匿名分类，Swift 的扩展没有名字.

/*
 Swift 中的扩展可以：
 
 添加计算实例属性和计算类型属性；
 定义实例方法和类型方法；
 提供新初始化器；
 定义下标；
 定义和使用新内嵌类型；
 使现有的类型遵循某协议
 */

// ##注意: 扩展可以向一个类型添加新的方法，但是不能重写已有的方法。

// 扩展的语法
// 使用 extension 关键字来声明

//extension SomeType {
//
//}

// 扩展可以使已有的类型遵循一个或多个协议。在这种情况下，协议名的书写方式与类或结构体完全一样：

//extension SomeType: SomeProtocol, Error {
//
//}

// ##注意：如果你向已存在的类型添加新功能，新功能会在该类型的所有实例中可用，即使实例在该扩展定义之前就已经创建。


// 添加计算属性

extension Double {
    // 计算属性
    var km: Double { return self / 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self * 100.0 }
    var mm: Double { return self * 1_000.0 }
    // 扩展不能包含存储属性
//    var haha: Double = 0
}

let distance: Double = 85475
print("distance = \(distance.km)")

// ##注意：扩展可以添加新的计算属性，但是不能添加存储属性，也不能向已有的属性添加属性观察者。



// 初始化器

//扩展可向已有的类型添加新的初始化器。这允许你扩展其他类型以使初始化器接收你的自定义类型作为形式参数，或提供该类型的原始实现中未包含的额外初始化选项。
//扩展能为类添加新的便捷初始化器，但是不能为类添加指定初始化器或反初始化器。指定初始化器和反初始化器 必须由原来类的实现提供。


struct Point {
    var x: Double = 0
    var y: Double = 0
}

struct Size {
    var width: Double = 0
    var height: Double = 0
}

struct Rect {
    var origin: Point
    var size: Size
    
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
}


extension Rect {
    
    init(center: Point, size: Size) {
        let x = center.x - size.width / 2.0
        let y = center.y - size.height / 2.0
        self.init(origin: Point(x: x, y: y), size: size)
    }
    
    // 扩展方法
    func description() -> String {
        return "Rect:[(\(origin.x, origin.y), \(size.width, size.height)]"
    }
}


let rect = Rect(center: Point(x: 60, y: 80), size: Size(width: 100, height: 200))


// 方法
// 扩展可以为已有的类型添加新的实例方法和类型方法。

// 例如上面例子中为 Rect 结构体扩展的 description 方法

print(rect.description())


// 异变实例方法

// 示例

extension Int {
    
    /// 扩展一个 square 方法
    mutating func square() {
        self = self * self
    }
}

var a = 9
a.square()
print("a = \(a)")


// 下标

// 扩展能为已有的类型添加新的下标。

// 示例：

extension Int {
    subscript(_ digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0 ..< decimalBase {
            decimalBase *= 10
        }
        
        return self / decimalBase % 10
    }
}

var b  = 10086
print(b[6])


// 内嵌类型
// 扩展可以为已有的类、结构体和枚举类型添加新的内嵌类型：

extension Int {
    enum Kind { case negative, zero, positive }
    var kind: Kind {
        switch self {
        case 0:
            return .zero
        case let x where x > 0 :
            return .positive
        default:
            return .negative
        }
    }
}

print(b.kind)







