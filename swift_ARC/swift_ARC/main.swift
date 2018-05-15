//
//  main.swift
//  swift_ARC
//
//  Created by 唯赢 on 2018/5/14.
//  Copyright © 2018年 李立. All rights reserved.
//

import Foundation


// # ARC - 自动引用计数(内存管理) #


// Swift 使用自动引用计数(ARC)机制来追踪和管理你的 App 的内存。在大多数情况下，这意味着 Swift 的内存管理机制会一直起作用，你不需要自己考虑内存管理。当这些实例不在需要时，ARC会自动释放类实例所占用的内存。

// ## 注意：引用计数只应用于类的实例。结构体和枚举是值类型，不是引用类型，没有通过引用存储和传递。


/*
 ### ARC的工作机制
 每次你创建一个类的实例，ARC 会分配一大块内存来存储这个实例的信息。这些内存中保留有实例的类型信息，以及该实例所有存储属性值的信息。
 此外，当实例不需要时，ARC 会释放该实例所占用的内存，释放的内存用于其他用途。这确保类实例当它不在需要时，不会一直占用内存。
 然而，如果 ARC 释放了正在使用的实例内存，那么它将不会访问实例的属性，或者调用实例的方法。确实，如果你试图访问该实例，你的app很可能会崩溃。
 为了确保使用中的实例不会消失，ARC 会跟踪和计算当前实例被多少属性，常量和变量所引用。只要存在对该类实例的引用，ARC 将不会释放该实例。
 为了使这些成为可能，无论你将实例分配给属性，常量或变量，它们都会创建该实例的强引用。之所以称之为“强”引用，是因为它会将实例保持住，只要强引用还在，实例是不允许被销毁的。
 */


class Person {
    var name : String
    init(name: String) {
        self.name = name
        print("Person类实例初始化成功!")
    }
    
    deinit {
        print("Person类实例销毁!")
    }
}

var p: Person? = Person(name: "lili")        // 实例创建并初始化成功，打印：Person类实例初始化成功!
print("person.name = \(p!.name)")

p = nil // 告诉系统p变量不对Person的实例进行引用了，也就是不适用Person的实例。
// 此时只有一个变量对Person实例进行引用，当 p = nil 执行之后，ARC会对Person实例进行释放，将会打印：Person类实例销毁!


// 多个引用

var p1 : Person?
var p2 : Person?
var p3 : Person?

p1 = Person(name: "Tom")
p2 = p1
p3 = p1

print("p1.name = \(p1!.name)")

// 释放
// 不进行引用
p1 = nil
p2 = nil
p3 = nil

// 如果有其中一个引用没有被设置成nil，那么Person的实例将会在内存中一直存在不会释放



// 类实例之间的循环强引用

// 在上面的例子中，ARC 能够追踪你所创建的 Person 实例的引用数量，并且会在 Person 实例不在使用时销毁。
// 总之，写出某个类永远不会变成零强引用的代码是可能的。如果两个类实例彼此持有对方的强引用，因而每个实例都让对方一直存在，就会发生这种情况。这就是所谓的循环强引用。

// 解决循环强引用问题，可以通过定义类之间的关系为弱引用( weak )或无主引用( unowned )来代替强引用。

// 循环引用的例子：

//class Man : Person {
//    var apartment: Apartment?
//    deinit {
//        print("Man deinit.")
//    }
//}
//
//class Apartment {
//    var tenant: Man?
//    let unit: String
//    init(unit: String) {
//        self.unit = unit
//    }
//
//    deinit {
//        print("Apartment deinit.")
//    }
//}
//
//var m: Man? = Man(name: "lili")
//var apartment: Apartment? = Apartment(unit: "621785423684412")
//
//m!.apartment = apartment
//apartment!.tenant = m
//
//print("m.name = \(m!.name) apartment.unit = \(apartment!.unit)")
//
//m = nil
//apartment = nil

// 就这样，两个强引用互相持有对方的实例，造成循环强引用
// 怎么解决：在任意一个成员中间打破这种规则，可以给 apartment 或者 tenant 声明成弱引用类型

// Swift 提供了两种办法用来解决你在使用类的属性时所遇到的循环强引用问题：弱引用（ weak reference ）和无主引用（ unowned reference )。
// 弱引用和无主引用允许循环引用中的一个实例引用另外一个实例而不保持强引用。这样实例能够互相引用而不产生循环强引用。

// 对于生命周期中会变为 nil 的实例使用弱引用。相反，对于初始化赋值后再也不会被赋值为 nil 的实例，使用无主引用。

class Man : Person {
    weak var apartment: Apartment?  // 使用 weak 关键字修饰，声明成若引用类型
    deinit {
        print("Man deinit.")
    }
}

class Apartment {
    var tenant: Man?
    let unit: String
    init(unit: String) {
        self.unit = unit
    }
    
    deinit {
        print("Apartment deinit.")
    }
}

var m: Man? = Man(name: "lili")
var apartment: Apartment? = Apartment(unit: "621785423684412")

m!.apartment = apartment
apartment!.tenant = m

print("m.name = \(m!.name) apartment.unit = \(apartment!.unit)")

m = nil
apartment = nil


// 弱引用（不对引用计数+1）

// 弱引用不会对其引用的实例保持强引用，因而不会阻止 ARC 释放被引用的实例。这个特性阻止了引用变为循环强引用。声明属性或者变量时，在前面加上 weak 关键字表明这是一个弱引用。

// 由于弱引用不会强保持对实例的引用，所以说实例被释放了弱引用仍旧引用着这个实例也是有可能的。因此，ARC 会在被引用的实例被释放是自动地设置弱引用为 nil 。由于弱引用需要允许它们的值为 nil ，它们一定得是可选类型。

// 你可以检查弱引用的值是否存在，就像其他可选项的值一样，并且你将永远不会遇到“野指针”。

// ##注意: 在 ARC 给弱引用设置 nil 时不会调用属性观察者。




// 无主引用

// 和弱引用类似，无主引用不会牢牢保持住引用的实例。但是不像弱引用，总之，无主引用假定是永远有值的。因此，无主引用总是被定义为非可选类型。你可以在声明属性或者变量时，在前面加上关键字 unowned 表示这是一个无主引用。

// 由于无主引用是非可选类型，你不需要在使用它的时候将它展开。无主引用总是可以直接访问。不过 ARC 无法在实例被释放后将无主引用设为 nil ，因为非可选类型的变量不允许被赋值为 nil 。

// ##注意:
// 1.如果你试图在实例的被释放后访问无主引用，那么你将触发运行时错误。只有在你确保引用会一直引用实例的时候才使用无主引用。
//
// 2.还要注意的是，如果你试图访问引用的实例已经被释放了的无主引用，Swift 会确保程序直接崩溃。你不会因此而遭遇无法预期的行为。所以你应当避免这样的事情发生。






















