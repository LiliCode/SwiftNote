//
//  main.swift
//  swift_enumeration
//
//  Created by 唯赢 on 2018/5/7.
//  Copyright © 2018年 李立. All rights reserved.
//

import Foundation

// # 枚举类型 #

// 定义:
// 枚举为一组相关值定义了一个通用类型，从而可以让你在代码中类型安全地操作这些值。

// 关键字：enum

// 枚举语法

enum SomeEnumeration {
    // 使用enum关键字声明枚举类型，然后将所有类型的定义放在{}中
}

enum CompassPoint {
    case north
    case south
    case east
    case wast
}

// CompassPoint 为类型名称
// north， south， east和 west就是枚举的成员值（或成员） case关键字则明确了要定义成员值。
// 不像 C 和 Objective-C 那样，Swift 的枚举成员在被创建时不会分配一个默认的整数值。
// 在上文的 CompassPoint例子中， north， south， east和 west并不代表 0， 1， 2和 3。而相反，不同的枚举成员在它们自己的权限中都是完全合格的值，并且是一个在 CompassPoint中被显式定义的类型。

// 多个枚举值可以出现在同一行中
enum Planet {
    case mercury, venus, earth, mars
}

// 定一个枚举变量
var directtion = CompassPoint.north
print(directtion)
// directtion 在声明的时候推断出CompassPoint的枚举类型，在后面就可以使用.语法给directtion赋值
directtion = .wast
print(directtion)

// 使用switch-case语句匹配枚举值
let drct = CompassPoint.wast
switch drct {
case .north:
    print(".north")
case .wast:
    print(".wast")
default:
    print("无枚举值")
}

// 关联值
// 例如产品条码：分成条形码和二维码，条码和二维码都是用不同的值代替
enum BarCode {
    case upc(Int, Int, Int, Int)    // 条形码类型，并且关联了(Int, Int, Int, Int)类型的元组
    case qrCode(String) // 二维码类型，关联了(String)类型的元组
}

var barcode = BarCode.upc(8, 84514, 26542, 1)
switch barcode {
case .upc(let numberSystem, let manifacturer, let product, let check):
    print(".upc \(numberSystem) \(manifacturer) \(product) \(check)")
case .qrCode(let code):
    print(".qrCode \(code)")
default:
    print("没有相关联的枚举")
}

// 原始值
// 作为相关值的列一种选择，枚举成员可以用相同类型的默认值预先填充
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

print(ASCIIControlCharacter.tab)

// 注意：关联值和原始值是不同的概念，原始值是在枚举声明的时候为类型设置初始值；关联值是在定义枚举变量的时候设置的值

// 隐式指定原始值
// 当你在操作存储整数和字符串原始值枚举的时候，你不必为每一个成员都分配一个原始值。当你没有分配时，Swift会自动分配值
// 当整数值作为原始值时，每一个成员的隐式值都比前一个大一，如果第一个成员没有值，那么它就是0
enum PlanetType: Int {
    case mercurt = 1
    case venus
    case earth
}

// 当字符串被用作原始值，那么每一个成员的隐式原始值则是那个成员的名称。
enum PersonName: String {
    case lili = "Lili"
    case tom
    case jac
}
// 此时.lili的原始值就是"Lili", tom的原始值就是默认的"tom"

// 你可以用 rawValue属性来访问一个枚举成员的原始值：
let name = PersonName.lili.rawValue
print(name)
let planet = PlanetType.venus.rawValue
print(planet)

// 从原始值初始化
// 如果你用原始值类型来定义一个枚举，那么枚举就会自动收到一个可以接受原始值类型的值的初始化器（叫做 rawValue的形式参数）然后返回一个枚举成员或者 nil 。
// 你可以使用这个初始化器来尝试创建一个枚举的新实例。

// 使用原始值初始化器
let pName = PersonName(rawValue: "Lili")    // 从PersonName中找到初始值为"Lili"的枚举类型
if pName != nil {
    print(pName!)
}
// 原始值初始化器是一个可失败初始化器，因为不是所有原始值都将返回一个枚举成员。


// 递归枚举
// 递归枚举是拥有另一个枚举成员关联值的枚举。
// 当编译器操作递归枚举时必须插入间接寻址层。你可以在声明枚举成员之前使用 indirect关键字来明确它是递归的。

enum ArithmeticExpression {
    case number(Int)
    indirect case add(ArithmeticExpression, ArithmeticExpression)
    indirect case subb(ArithmeticExpression, ArithmeticExpression)
    indirect case mul(ArithmeticExpression, ArithmeticExpression)
    indirect case div(ArithmeticExpression, ArithmeticExpression)
}

func evaluete(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case .number(let num):
        return num
    case .add(let x, let y):
        return evaluete(x) + evaluete(y)
    case .subb(let x, let y):
        return evaluete(x) - evaluete(y)
    case .mul(let x, let y):
        return evaluete(x) * evaluete(y)
    case .div(let x, let y):
        return evaluete(x) / evaluete(y)
    default:
        return 0
    }
}

// 实现 (6 + 3) * 2
let _v6 = ArithmeticExpression.number(6)
let _v3 = ArithmeticExpression.number(3)
let _v2 = ArithmeticExpression.number(2)
let sum = ArithmeticExpression.add(_v6, _v3)
let result = ArithmeticExpression.mul(sum, _v2)
print("(6 + 3) * 2 = \(evaluete(result))")
















