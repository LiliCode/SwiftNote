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


// 数组-Array
// 数组是以有序的存储相同类型的值，相同类型的值可以在数组中多次出现
let array: [String] = ["Swift", "C", "C++", "Objective-C"]  // 声明一个存储String类型的不可变数组
print(array)
var mArray: [String] = Array(array);
mArray.insert("Javascript", at: 0)      // 插入一个元素
print(mArray)

// 数组类型语法
// Swift数组类型完整写法 Array<Element>, Element就是数组允许存入的元素类型。
// 你可以使用简写[Element]的方式来声明数组。尽管两种格式的效果都是相同的，但是推荐使用简写。
let simpleArray: [String] = ["simple", "oh"]
print("简写声明数组：\(simpleArray)")
// 声明一个空数组
let emptyArray = [Int]()    // emptyArray 会通过类型推断为[Int]
print("emptyArray.count = \(emptyArray.count)")
let arr: [Int] = [] // 如果在声明数组时，显示提供了类型信息，可以直接使用[]初始化一个数组
print("arr.count = \(arr.count)")

// 使用默认值创建数组
// Swift提供了使用初始化器来创建一个大小切元素都设置为默认值的数组
var defaultArray = Array(repeating: 0, count: 8)    // 在这里创建了一个元素个数为8且默认值为0的数组
print("默认值初始化数组: \(defaultArray)")

// 数组连接->(多个数组拼接在一起)
// 数组连接之后的类型，将从连接的的数组中推断出类型
// 数组连接通过加号运算符操作,Array重载了加号运算符
var catArray = mArray + simpleArray
print("数组连接：\(catArray)")

// 使用数组字面量创建数组
var shoppingList = ["Eggs", "Milk", "Apple", "Pen"]     // 类型推断会认定为String类型的数组
print("shoppingList: \(shoppingList)")

// 访问和修改数组
// 使用.isEmpty来判断是否是空数组，就可以省去判断.count是否为0
if (shoppingList.isEmpty) {
    print("shoppingList是空数组")
} else {
    print("shoppingList不是空数组")
}

// 可以通过append(_:)方法在数组末尾添加元素
shoppingList.append("Oreo")
// 可以通过insert(_:, at:)方法向数组中插入元素到指定位置
shoppingList.insert("Phone", at: 1)
print("insert element: \(shoppingList)")
// 通过下标取出元素
let item = shoppingList[0]
print("item is \(item)")
// 删除元素:通过remove(at:)方法按下标删除
shoppingList.remove(at: 1)  // 删除下标为1的元素
shoppingList.removeLast()   // 删除最后一个元素
print("删除之后的数组元素：\(shoppingList)")

// 数组遍历
// 使用for-in循环遍历
for element in shoppingList {
    print("shoppingList 元素：\(element)")
}

// 如果想要得到数组元素的下标，可以使用emumerated()方法来遍历数组，改方法返回的是一个包含了下标索引和元素的元组
for (index, element) in shoppingList.enumerated() {
    print("shoppingList[\(index)]: \(element)")
}



// 合集-Set
// 合集将同种类型的元素值无序的存放一个集合中，但值不会重复
// 如果对元素顺序没有要求时，可以使用合集代替数组，或者是要求对元素不重复的时候。

// Set类型的哈希值
// 为了能让类型存储在合集中，那么它必须是可哈希的（例如:a.hashValue），意思就是说类型必须提供能计算他自身哈希值的方法。
// 所有Swift的基础类型都是可哈希的（比如：String, Int, Double, Bool）
// .hashValue 是Hashable协议中的方法
let a = 9, b = 8
if a.hashValue == b.hashValue {
    print("a.hashValue == b.hashValue")
} else {
    print("a.hashValue != b.hashValue")
}

// 如果自定义类型需要放入Set中，就必须遵循Hashable协议并实现hashValue方法

// Set类型语法
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters)")
// 添加元素
letters.insert("h")
letters.insert("e")
letters.insert("l")
letters.insert("l")
letters.insert("o")
print(letters)  // 输出的元素不会按照上面的顺序排列

// 使用数组字面量创建Set
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
print(favoriteGenres)
// favoriteGenres变量被声明为元素为String类型的Set，写作为Set<String>
// Set类型不能从数组类型推断出来，所以声明Set变量的时候必须显示的指定类型
// 可以简写成如下:
//var favoriteGenres: Set = ["Rock"]

// 访问和修改合集
// 增加元素: insert(_:)
// 删除元素: remove(_:)
favoriteGenres.insert("Tom")
if let item = favoriteGenres.remove("Rock") {
    print("删除成功：\(item)")
} else {
    print("删除失败，没有这个元素")
}
print(favoriteGenres)

// 集合的遍历
for item in favoriteGenres {
    print("集合 favoriteGenres 的元素：\(item)")
}
// 如果要以特定的顺序遍历
for item in favoriteGenres.sorted() {
    print("sorted 集合 favoriteGenres 的元素：\(item)")
}

// Set的操作 <略>


// 字典-Dictionary
// 字典是存储无序的互相关联的同一类型的键和同一类型的值的集合。每一个值都有唯一的键与之对应。
// 字典是无序集合，通过键获取对应的值，很类似生活中的字典.

// 字典的简写语法
// Dictionart<key, value> ，其中key是用来作为字典的键，value就是值，key必须遵循Hashable协议
// 同样可以同数组一样的简写语法：[key: value]

// 创建一个字典
var namesOfIntegers = [Int:String]()
print("namesOfIntegers.count = \(namesOfIntegers.count)")
// 使用字典字面量来创建一个数组
var names: [Int:String] = [0: "lili", 1: "tom"]
print(names)
var persons = ["lili":"18281863522", "tom":"13545214562"]   // 类型推断成类型为[String: String]的字典
print(persons)

// 访问和修改字典
if let tel = persons["lili"] {
    print("lili tel: \(tel)")
} else {
    print("查无此人")
}

// 添加键值对
persons["Stan"] = "12315"
print(persons)

// 删除键值对
if let tel = persons.removeValue(forKey: "tom") {
    print("已经删除tom: \(tel)")
} else {
    print("查无此人")
}
print(persons)

// 更新值
persons["tom"] = "110"  // 通过下标法直接更新值
print(persons)
// 使用字典的 updateValue(_:forKey:)方法来设置或者更新特点键的值
// updateValue(_:forKey:)返回一个更新后的旧值，是一个可选项，这个可选项可以检测你是否更新成功
if let oldValue = persons.updateValue("10086", forKey: "tom") {
    print("tom的tel更新成功:\(oldValue)")
} else {
    print("查无此人")
}
print(persons)

// 字典的遍历
// for-in循环遍历字典的键值对，字典的每一个元素返回为(key, value)元组
for (key, value) in persons {
    print("\(key): \(value)")
}

// 通过字典的.keys遍历值<OC中为.allKeys>
for key in persons.keys {
    print("\(key) : \(persons[key]!)")
}

// 遍历字典的值
for value in persons.values {
    print("value: \(value)")
}

// 如果要以特定的顺序遍历，可以使用字典的sorted()方法
//let sortPersons = persons.sorted { ((key1, value1), (key2, value2)) -> Bool in
//    return key1 > key2;
//}
//print(sortPersons)




