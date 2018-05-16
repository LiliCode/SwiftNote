//
//  main.swift
//  swift_异常处理
//
//  Created by 唯赢 on 2018/5/15.
//  Copyright © 2018年 李立. All rights reserved.
//

import Foundation


// # 异常处理/错误处理 #

// 错误处理是响应和接收来自你程序中错误条件的过程。Swift 给运行时可恢复错误的抛出、捕获、传递和操纵提供了一类支持。

// 有些函数和方法不能保证总能完全执行或者产生有用的输出。可选项用来表示不存在值，但是当函数错误，能够了解到什么导致了错误将会变得很有用处，这样你的代码就能根据错误来响应了。


// 表示和抛出错误
// 在 Swift 中，错误表示为遵循 Error 协议类型的值。这个空的协议明确了一个类型可以用于错误处理。

enum VendingMachineError : Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

// 抛出一个错误允许你明确某些意外的事情发生了并且正常的执行流不能继续下去。你可以使用 throw 语句来抛出一个错误。
//throw VendingMachineError.insufficientFunds(coinsNeeded: 9)


// 处理错误
// 当一个错误被抛出，周围的某些代码必须为处理错误响应——比如说，为了纠正错误，尝试替代方案，或者把错误通知用户。


// 使用抛出函数传递错误
// 为了明确一个函数或者方法可以抛出错误，你要在它的声明当中的形式参数后边写上 throws关键字。使用 throws标记的函数叫做抛出函数。如果它明确了一个返回类型，那么 throws关键字要在返回箭头 ( ->)之前。

// 例如：
func canThrowErrors() throws -> String {
    
    return "canThrowErrors"
}

// 抛出函数可以把它内部抛出的错误传递到它被调用的生效范围之内。
// ##注意: 只有抛出函数可以传递错误。任何在非抛出函数中抛出的错误都必须在该函数内部处理。


// 例如：自动售货机模型

struct Item {
    var price: Double
    var count: Int
}

class VendingMachine {
    var inventory = ["Candy Bar" : Item(price: 23.4, count: 9),
                     "Chips" : Item(price: 12.5, count: 2),
                     "Pretzels" : Item(price: 80.2, count: 1)]
    
    func vend(itemNamed name: String?) throws {
        guard name != nil else {
            throw VendingMachineError.invalidSelection  // 无效输入
        }
        
        if let item = inventory[name!] {
            guard item.count > 0 else {
                throw VendingMachineError.insufficientFunds(coinsNeeded: 0)
            }
            
            print("item: price = \(item.price) count = \(item.count)")
        } else {
            throw VendingMachineError.invalidSelection
        }
    }
}

let machine = VendingMachine()

// 使用 do-catch 处理异常错误

// 使用 do-catch语句来通过运行一段代码处理错误。如果do分句中抛出了一个错误，它就会与 catch分句匹配，以确定其中之一可以处理错误。
// 在 catch后写一个模式来明确分句可以处理哪个错误。如果一个 catch分句没有模式，这个分句就可以匹配所有错误并且绑定这个错误到本地常量 error上。
do {
    try machine.vend(itemNamed: "lili")
} catch VendingMachineError.invalidSelection {
    try machine.vend(itemNamed: "Pretzels")
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    try machine.vend(itemNamed: "Chips")
} catch VendingMachineError.outOfStock {
    print("outOfStock")
}

do {
    
} catch {   // catch 没有条件，可以匹配任何错误
    
}


// 在不抛出错误的函数中， do-catch 分句就必须处理错误。在可抛出函数中，要么 do-catch 分句处理错误，要么调用者处理。如果错误被传递到了顶层生效范围但还是没有被处理，你就会得到一个运行时错误了。

// 转换错误为可选项
// 使用 try?通过将错误转换为可选项来处理一个错误。如果一个错误在 try?表达式中抛出，则表达式的值为 nil。


// 取消错误传递
// 事实上有时你已经知道一个抛出错误或者方法不会在运行时抛出错误。在这种情况下，你可以在表达式前写 try!来取消错误传递并且把调用放进不会有错误抛出的运行时断言当中。如果错误真的抛出了，你会得到一个运行时错误。
// try!
//try! machine.vend(itemNamed: "oo")    // 使用 try! 的前提是：可以保证不会抛出异常错误





// 指定清理操作
// 使用 defer语句来在代码离开当前代码块前执行语句合集。这个语句允许你在以任何方式离开当前代码块前执行必须要的清理工作——无论是因为抛出了错误还是因为 return或者 break这样的语句。比如，你可以使用 defer语句来保证文件描述符都关闭并且手动指定的内存到被释放。

// defer语句延迟执行直到当前范围退出。这个语句由 defer关键字和需要稍后执行的语句组成。被延迟执行的语句可能不会包含任何会切换控制出语句的代码，比如 break或 return语句，或者通过抛出一个错误

func exists(_ fileName: String) -> Bool {
    guard !fileName.isEmpty else {
        return false
    }
    
    return true
}

func open(_ fileName: String) -> String? {
    guard !fileName.isEmpty else {
        return nil
    }
    
    return String("读取文件:文件操作")
}

func close(_ fileName: String) -> Bool {
    guard !fileName.isEmpty else {
        return false
    }
    
    return true
}

func proressFile(fileName: String) {
    if exists(fileName) {
        if let content = open(fileName) {
            print("content is \(content)")
        }
        
        defer {
            if close(fileName) {
                print("文件关闭成功")
            }
        }
    }
    
}

proressFile(fileName: "/usr/home/Documents/temp.txt")





