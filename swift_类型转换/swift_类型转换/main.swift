//
//  main.swift
//  swift_类型转换
//
//  Created by 唯赢 on 2018/5/16.
//  Copyright © 2018年 李立. All rights reserved.
//

import Foundation


// # 类型转换 #

// 类型转换可以判断实例的类型，也可以将该实例在其所在的类层次中视为其父类或子类的实例。
// Swift 中类型转换的实现为 is 和 as 操作符。这两个操作符使用了一种简单传神的方式来检查一个值的类型或将某个值转换为另一种类型。

// 类型检查
// 使用类型检查操作符 （ is ）来检查一个实例是否属于一个特定的子类。如果实例是该子类类型，类型检查操作符返回 true ，否则返回 false 。


let string = "lili"
if string is String {
    print("String ")
}


// 向下类型转换

//某个类类型的常量或变量可能实际上在后台引用自一个子类的实例。当你遇到这种情况时你可以尝试使用类型转换操作符（ as? 或 as! ）将它向下类型转换至其子类类型。
// 由于向下类型转换能失败，类型转换操作符就有了两个不同形式。条件形式， as? ，返回了一个你将要向下类型转换的值的可选项。强制形式， as! ，则将向下类型转换和强制展开结合为一个步骤。

class Person {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Student : Person {
    var no: Int
    var score: Double
    
    init(name: String, no: Int, score: Double) {
        self.score = score
        self.no = no
        super.init(name: name)
    }
}

class UniversityStudent : Student {
    
}

let roster = [UniversityStudent(name: "lili", no: 1, score: 89.5), Student(name: "tom", no: 2, score: 100)]

for stu in roster {
    if let student = stu as? Student {
        print("student: name = \(student.name) no = \(student.no) score = \(student.score)")
    }
}



// Any 和 AnyObject 的类型转换

// -- Swift 为不确定类型提供了两种类型别名:
// Any: 可以表示任何类型，包括函数类型，包括可选类型
// AnyObject 可以表示任何类类型实例（是用来修饰对象）


















