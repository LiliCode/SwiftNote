//
//  main.swift
//  swift_可选链
//
//  Created by 唯赢 on 2018/5/15.
//  Copyright © 2018年 李立. All rights reserved.
//

import Foundation


// # 可选链 #

// 可选链是一个调用和查询可选属性、方法和下标的过程，它可能为 nil 。如果可选项包含值，属性、方法或者下标的调用成功；如果可选项是 nil ，属性、方法或者下标的调用会返回 nil 。多个查询可以链接在一起，如果链中任何一个节点是 nil ，那么整个链就会得体地失败。

// ## 注意：Swift 中的可选链与 Objective-C 中的 nil 信息类似，但是它却工作在任意类型上，而且它能检测成功还是失败。


// 可选链(?)代替强制展开(!)

// 你可以通过在你希望如果可选项为非 nil 就调用属性、方法或者脚本的可选值后边使用问号（ ? ）来明确可选链。这和在可选值后放叹号（ ! ）来强制展开它的值非常类似。主要的区别在于可选链会在可选项为 nil 时得到地失败，而强制展开则在可选项为 nil 时触发运行时错误。

class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
}

var p = Person()
//p.residence = Residence()

// 使用可选链提供另一种访问 numberOfRooms
// 这将会告诉 Swift 把可选 residence 属性“链接”起来并且取回 numberOfRooms 的值，如果 residence 存在的话。
if let numberOfRooms = p.residence?.numberOfRooms {
    print(numberOfRooms)
} else {
    print("numberOfRooms is nil")
}

// 使用强制张开的方式访问
// 如果是用强制展开就会触发运行时错误
//print("numberOfRooms is \(p.residence!.numberOfRooms)")


// 为可选链定义模型类

// 你可以使用可选链来调用属性、方法和下标不止一个层级。这允许你在相关类型的复杂模型中深入到子属性，并检查是否可以在这些自属性里访问属性、方法和下标。



/*
 链的多层连接
 你可以通过连接多个可选链来在模型中深入访问属性、方法以及下标。总之，多层可选链不会给返回的值添加多层的可选性。
 
 也就是说：
 
 如果你访问的值不是可选项，它会因为可选链而变成可选项；
 如果你访问的值已经是可选的，它不会因为可选链而变得更加可选。
 因此：
 
 如果你尝试通过可选链取回一个 Int 值，就一定会返回 Int? ，不论通过了多少层的可选链；
 类似地，如果你尝试通过可选链访问 Int? 值， Int? 一定就是返回的类型，无论通过了多少层的可选链。
 */


class Node {
    var number: Int
    var next: Node?
    
    init(number: Int) {
        self.number = number
    }
    
    func showNumber() -> Void {
        print("number = \(self.number)")
    }
    
    deinit {
        print("Node deinit.")
    }
}


var node = Node(number: 8)
node.next = Node(number: 29)

if let number = node.next?.next?.number {
    print(number)
} else {
    print("number is nil")
}

node.next?.showNumber()






