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






















