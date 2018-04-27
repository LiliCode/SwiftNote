//
//  main.swift
//  swift_collect
//
//  Created by 唯赢 on 2018/4/25.
//  Copyright © 2018年 李立. All rights reserved.
//

import Foundation

// # 集合类型 #

// Swift提供了三种主要集合类型：数组(Array)、字典(Dictionary)、合集(Set)
// 数组-Array：有序集合
// 合集-Set：无序且值唯一的集合
// 字典-Dictionart:无序的键值对集合

// 集合的可变性：
// 使用var声明的集合类型就是可变的(增加、删除。。。)；如果使用let申明的集合类型就是不可变的
// 在集合不需要改变的情况下可以声明成不可变集合，这样Swift编译器可以优化你创建的集合的性能

// 数组
// 数组是以有序的存储相同类型的值，相同类型的值可以在数组中多次出现
let array: [String] = ["Swift", "C", "C++", "Objective-C"]  // 声明一个存储String类型的不可变数组
print(array)
var mArray: [String] = Array(array);
mArray.insert("Javascript", at: 0)      // 插入一个元素
print(mArray)






