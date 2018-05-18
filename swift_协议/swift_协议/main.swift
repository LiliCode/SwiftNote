//
//  main.swift
//  swift_协议
//
//  Created by 唯赢 on 2018/5/18.
//  Copyright © 2018年 李立. All rights reserved.
//

import Foundation

// # 协议 - Protocol #


// 协议可以为方法、属性、以及其他特定的任务需求或功能定义蓝图。
// 协议可以被类、结构体、枚举类型采纳已提供所需功能的具体实现。
// 满足了协议中需求的任意类型都叫做遵循了该协议。
// 协议是为方法、属性等定义一套规范，没有具体的实现，类似于Java中的抽象接口，它只是描述了方法或属性的骨架，而不是实现

// 协议的语法
// 使用 protocol 关键字声明协议

protocol SomeProtocol {
    // protocol definition goes here
}

// 在自定义类型声明时，将协议名放在类型名的冒号之后来表示该类型采纳一个特定的协议。多个协议可以用逗号分开列出：

struct SomeStructure: SomeProtocol, Error {
    
}

// 若一个类拥有父类，将这个父类名放在其采纳的协议名之前，并用逗号分隔：

class SomeClass : NSObject, SomeProtocol {
    
}



// 属性要求

/*
 协议可以要求所有遵循该协议的类型提供特定名字和类型的实例属性或类型属性。协议并不会具体说明属性是储存型属性还是计算型属性——它只具体要求属性有特定的名称和类型。协议同时要求一个属性必须明确是可读的或可读的和可写的。
 
 若协议要求一个属性为可读和可写的，那么该属性要求不能用常量存储属性或只读计算属性来满足。若协议只要求属性为可读的，那么任何种类的属性都能满足这个要求，而且如果你的代码需要的话，该属性也可以是可写的。
 
 属性要求定义为变量属性，在名称前面使用 var 关键字。可读写的属性使用 { get set } 来写在声明后面来明确，使用 { get } 来明确可读的属性。
 */

protocol AnotherProtocol {
    var mustBeSettable: Int {set get}
    static var someTypeProperty: Int {set get}
}

protocol FullyNamed {
    var fullName: String {get}  // 只读
}

struct Person : FullyNamed {
    var fullName: String
}

var tom = Person(fullName: "tom")
print("tom.name = \(tom.fullName)")

// 就这样：
// 每一个 Person 的实例都有一个名为 fullName 的 String 类型储存属性。这符合了 FullyNamed 协议的单一要求，并且表示 Person 已经正确地遵循了该协议。（若协议的要求没有完全达标，Swift 在编译时会报错。


// 方法要求

// 协议可以要求采纳的类型实现指定的实例方法和类方法。这些方法作为协议定义的一部分，书写方式与正常实例和类方法的方式完全相同，但是不需要大括号和方法的主体。允许变量拥有参数，与正常的方法使用同样的规则。但在协议的定义中，方法参数不能定义默认值。


// 例如：

protocol RandomNumberGenerator {
    func random() -> Double
}

/// 这个类实现了著名的 linear congruential generator 伪随机数发生器算法
class LinearCongruentialGenerator : RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    
    func random() -> Double {
        lastRandom = (lastRandom * a + c).truncatingRemainder(dividingBy: m)
        return lastRandom / m
    }
}

let generator = LinearCongruentialGenerator()
print("伪随机数：\(generator.random())")
print("伪随机数：\(generator.random())")
print("伪随机数：\(generator.random())")



// 异变方法要求

// 若你定义了一个协议的实例方法需求，想要异变任何采用了该协议的类型实例，只需在协议里方法的定义当中使用 mutating 关键字。这允许结构体和枚举类型能采用相应协议并满足方法要求。

protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch : Togglable {
    case off, on
    
    mutating func toggle() {
        switch self {
        case .off :
            self = .on
        case .on:
            self = .off
        }
    }
}

var lighSwift = OnOffSwitch.off
lighSwift.toggle()
print(lighSwift)


// 初始化器要求
// 协议可以要求遵循协议的类型实现指定的初始化器。和一般的初始化器一样，只用将初始化器写在协议的定义当中，只是不用写大括号也就是初始化器的实体：


//protocol SomeProtocol {
//    init(paramter: Int)
//}


// 将协议作为类型

// 实际上协议自身并不实现功能。不过你创建的任意协议都可以变为一个功能完备的类型在代码中使用。
//
// 由于它是一个类型，你可以在很多其他类型可以使用的地方使用协议，包括：
//
// 在函数、方法或者初始化器里作为形式参数类型或者返回类型；
// 作为常量、变量或者属性的类型；
// 作为数组、字典或者其他存储器的元素的类型。

var p : FullyNamed  // 只有遵循了 FullyNamed 协议的类型，才能够赋值给变量 p
p = Person(fullName: "lili")    // Person 遵循了 FullyNamed 协议
print("协议作为类型：\(p.fullName)")

// 协议作形式参数
func showName(_ name: FullyNamed) {
    print("协议作形式参数：\(name.fullName)")
}

showName(p)





// 委托

























