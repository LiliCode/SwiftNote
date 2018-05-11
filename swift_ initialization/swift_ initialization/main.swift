//
//  main.swift
//  swift_ initialization
//
//  Created by 唯赢 on 2018/5/11.
//  Copyright © 2018年 李立. All rights reserved.
//

import Foundation

// # 初始化和反初始化 #

// 初始化

// 初始化器（类似于C++的构造函数）
// 初始化是为类、结构体或者枚举准备实例的过程。这个过需要给实例里的每一个存储属性设置一个初始值并且在新实例可以使用之前执行任何其他所必须的配置或初始化。

// 不同于 Objective-C 的初始化器，Swift 初始化器不返回值。这些初始化器主要的角色就是确保在第一次使用之前某类型的新实例能够正确初始化。
// 在创建类和结构体的实例时必须为所有的存储属性设置一个合适的初始值。存储属性不能遗留在不确定的状态中。
// 你可以在初始化器里为存储属性设置一个初始值，或者通过分配一个默认的属性值作为属性定义的一部分。

// ##注意 当你给一个存储属性分配默认值，或者在一个初始化器里设置它的初始值的时候，属性的值就会被直接设置，不会调用任何属性监听器

// 初始化器在创建特定类型的实例时被调用。在这个简单的形式中，初始化器就像一个没有形式参数的实例方法，使用 init 关键字来写：

// init() {
//
// }

class Person {
    var name: String
    var age: Double
    init() {    // 类似于C++的构造函数
        self.name = String()
        self.age = Double()
    }
}

let p = Person()    // 使用默认的初始化器
print("p.age = \(p.age)")

// ## 注意： 如果一个属性一直保持相同的初始值，可以提供一个默认值而不是在初始化器里设置这个值。最终结果是一样的，但是默认值将属性的初始化与声明更紧密地联系到一起。它使得你的初始化器更短更清晰，并且可以让你属性根据默认值推断类型。


// 自定义初始化器
// 初始化器形式参数

// 你可以提供初始化形式参数作为初始化器的一部分，来定义初始化过程中的类型和值的名称。初始化形式参数与函数和方法的形式参数具有相同的功能和语法。

struct Celsius {
    var temperatureInCelsius: Double    // 摄氏温度
    // 自定义初始化器(自定义构造函数)
    init(fromFahrenheit: Double) {  // 华氏温度转换摄氏温度
        temperatureInCelsius = (fromFahrenheit - 32.0) / 1.8
    }
    
    init(fromKelvin: Double) {  // 开尔文温度转换摄氏温度
        temperatureInCelsius = fromKelvin - 273.15
    }
}

let celsius = Celsius(fromKelvin: 290.1)
print("temperatureInCelsius = \(celsius.temperatureInCelsius) ℃")
let c = Celsius(fromFahrenheit: 82.5)
print("temperatureInCelsius = \(c.temperatureInCelsius) ℃")

// 形式参数和形式参数标签

struct Color {
    var red, green, blue, alpha: Double
    var description: String {
        return "R:\(red) G:\(green) B:\(blue) alpha:\(alpha)"
    }
    
    // 自定义参数构造函数
    init(R red: Double, G green: Double, B blue: Double, alpha: Double) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }
    
    static func whiteColor() -> Color {
        return Color(R: 1.0, G: 0.980392216, B: 0.980392216, alpha: 1)
    }
    
    static func blackColor() -> Color {
        return Color(R: 0, G: 0, B: 0, alpha: 1)
    }
    
    static func redColor() -> Color {
        return Color(R: 1.0, G: 0, B: 0, alpha: 1)
    }
    
    static func greenColor() -> Color {
        return Color(R: 0, G: 1, B: 0, alpha: 1)
    }
    
    static func blueColor() -> Color {
        return Color(R: 0, G: 0, B: 1, alpha: 1)
    }
}


print("redColor = \(Color.redColor().description)")
print("greenColor = \(Color.greenColor().description)")
print("blueColor = \(Color.blueColor().description)")

let darkGreenColor = Color(R: 0, G: 100.0/255.0, B: 0, alpha: 1)
print("darkGreenColor = \(darkGreenColor.description)")


// 无实际参数标签的初始化器

struct Number {
    var value: Int
    init(_ value: Int) {
        self.value = value
    }
}

let number = Number(8)
print("number.value = \(number.value)")

// 可选属性类型

// 如果你的自定义类型有一个逻辑上是允许“无值”的存储属性——大概因为它的值在初始化期间不能被设置，或者因为它在稍后允许设置为“无值”——声明属性为可选类型。可选类型的属性自动地初始化为 nil ，表示该属性在初始化期间故意设为“还没有值”。

class SurverQuestion {
    var text: String
    var response: String?   // 可选属性，可能为nil
    init(text: String) {
        self.text = text
    }
    
    func ask() {
        print(text)
    }
}

let question = SurverQuestion(text: "Do you like cheese?")
question.ask()
question.response = "Yes, do like cheese."
print(question.response!)


// 在初始化中分配常量属性
// 在初始化的任意时刻，你都可以给常量属性赋值，只要它在初始化结束是设置了确定的值即可。一旦为常量属性被赋值，它就不能再被修改了。
// ##注意：对于类实例来说，常量属性在初始化中只能通过引用的类来修改。它不能被子类修改。

// 默认初始化器
// Swift 为所有没有提供初始化器的结构体或类提供了一个默认的初始化器来给所有的属性提供了默认值。这个默认的初始化器只是简单地创建了一个所有属性都有默认值的新实例。


// 结构体类型的成员初始化器
// 如果结构体类型中没有定义任何自定义初始化器，它会自动获得一个成员初始化器。不同于默认初始化器，结构体会接收成员初始化器即使它的存储属性没有默认值。

struct Point {
    var x: Double
    var y: Double
}

let point = Point(x: 8.2, y: 2.9)
print(point)

struct Size {
    var widht: Double
    var height = Double(0)
}

let size = Size(widht: 90, height: 300)
print(size)


// 值类型的初始化器委托
// 初始化器可以调用其他初始化器来执行部分实例的初始化。这个过程，就是所谓的初始化器委托，避免了多个初始化器里冗余代码。

struct Rect {
    var origin: Point
    var size: Size
    
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    
    init(center: Point, size: Size) {
        let origin = Point(x: center.x - (size.widht / 2.0), y: center.y - (size.height / 2.0))
        self.init(origin: origin, size: size)   // 对于 init(center:size:) 初始化器来说，可以更方便(更清楚)地利用现有已经提供了准确功能的初始化器。
    }
}


// 类的继承和初始化
// 所有类的存储属性——包括从它的父类继承的所有属性——都必须在初始化期间分配初始值。
//
// Swift 为类类型定义了两种初始化器以确保所有的存储属性接收一个初始值。这些就是所谓的指定初始化器和便捷初始化器。


// 指定初始化器和便捷初始化器
class Computer {
    var name: String?
    
    // 指定初始化器
    init(name: String) {
        self.name = name
    }
    
    // 便捷初始化器: 使用 convenience 关键字声明
    convenience init(_ name: String) {
        self.init(name: name)   // 便捷初始化器必须从相同的类中调用另一个初始化器
    }
    
}

let comp = Computer("Dell")
print(comp.name!)

// 类类型的初始化器委托
// 为了简化指定和便捷初始化器之间的调用关系，Swift 在初始化器之间的委托调用有下面的三个规则:
//
// 规则 1
// 指定初始化器必须从它的直系父类调用指定初始化器。
//
// 规则 2
// 便捷初始化器必须从相同的类里调用另一个初始化器。
//
// 规则 3
// 便捷初始化器最终必须调用一个指定初始化器。
//
// 简单记忆的这些规则的方法如下：
//
// 指定初始化器必须总是向上委托。
// 便捷初始化器必须总是横向委托。















