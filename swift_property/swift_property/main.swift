//
//  main.swift
//  swift_property
//
//  Created by 唯赢 on 2018/5/8.
//  Copyright © 2018年 李立. All rights reserved.
//

import Foundation

// # 类和结构体 -- 属性、方法、下标 #




// 属性

// 属性可分为存储属性和计算属性

// 属性可以将值与特定的类、结构体或者是枚举联系起来。存储属性会存储常量或变量作为实例的一部分，反之计算属性会计算（而不是存储）值。
// 计算属性可以由类、结构体和枚举定义。存储属性只能由类和结构体定义。


// 存储属性
// 在其最简单的形式下，存储属性是作为一个特定类和结构体实例的一部分变量或常量

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

var fixedRange: FixedLengthRange = FixedLengthRange(firstValue: 2, length: 9)
fixedRange.firstValue = 8
//fixedRange.length = 4   // 语法错误，因为使用let声明的是一个常量，常量值不可修改

// 常量结构体实例的存储属性
// 如果使用let声明的创建的结构体，不能修改属性值，即使属性是一个变量(var声明的属性)也不可修改
let range = FixedLengthRange(firstValue: 8, length: 7)
//range.firstValue = 3

// 延迟存储属性（懒加载）
// 延迟存储属性的初始值在其第一次使用时才进行计算。你可以通过在其声明前标注 lazy 修饰语来表示一个延迟存储属性。
// ## 注意: 你必须把延迟存储属性声明为变量（使用 var 关键字），因为它的初始值可能在实例初始化完成之前无法取得。常量属性则必须在初始化完成之前有值，因此不能声明为延迟。
// ## 注意: 如果被标记为 lazy 修饰符的属性同时被多个线程访问并且属性还没有被初始化，则无法保证属性只初始化一次。
class Person {
    lazy var name = "lili"  // name在首次使用的时候就会初始化成"lili"
}

var p = Person()
print(p.name)


// 计算属性（相当于Objc重写get、set方法）
// 除了存储属性，类、结构体和枚举也能够定义计算属性，而它实际并不存储值。相反，他们提供一个读取器和一个可选的设置器来间接得到和设置其他的属性和值。

struct Point {
    var x: Double = Double()
    var y: Double = Double()
}

struct Size {
    var width: Double = Double()
    var height: Double = Double()
}

struct Rect {
    var origin: Point = Point(x: 0.0, y: 0.0)
    var size: Size = Size(width: 0.0, height: 0.0)
    
    var center: Point {
        // 重写get
        get {
            return Point(x: origin.x + size.width / 2.0, y: origin.y + size.height / 2.0)
        }
        
        // 重写set
        set(point) {
            origin.x = point.x - size.width / 2.0
            origin.y = point.y - size.height / 2.0
        }
        
        // 简写设置器（setter）声明
        // 如果一个计算属性的设置器没有为将要被设置的值定义一个名字，那么他将被默认命名为 newValue 。
//        set {
//            origin.x = newValue.x - size.width / 2.0
//            origin.y = newValue.y - size.height / 2.0
//        }
    }
}

var frame = Rect(origin: Point(x: 3.0, y: 5.9), size: Size(width: 40, height: 70))
frame.center = Point(x: 50, y: 60)
print(frame)


// 只读属性
// 一个有读取器但是没有设置器的计算属性就是所谓的只读计算属性。只读计算属性返回一个值，也可以通过点语法访问，但是不能被修改为另一个值。
// 你必须用 var 关键字定义计算属性——包括只读计算属性——为变量属性，因为它们的值不是固定的。

struct Cuboid {
    var widht = 0.0, height = 0.0, depth = 0.0
    // 只读属性
    var volume: Double {
        return widht * height * depth
    }
}

var cub = Cuboid(widht: 20, height: 30, depth: 10)
print("立方体的体积：\(cub.volume)m³")


// 属性观察者
// 属性观察者会观察并对属性值的变化做出回应。每当一个属性的值被设置时，属性观察者都会被调用，即使这个值与该属性当前的值相同。
// 你不需要为非重写的计算属性定义属性观察者，因为你可以在计算属性的设置器里直接观察和相应它们值的改变。

struct StepCounter {
    var totalSteps: Int = 0 {   // 属性观察
        willSet {
            newValue > totalSteps ? print("新值大于旧值") : print("旧值大于新值")
        }
        
        didSet {
            print("设值完成: \(totalSteps)")
        }
    }
}

var counter = StepCounter(totalSteps: 8)
counter.totalSteps = 2

// ## 注意
// 如果你以输入输出形式参数传一个拥有观察者的属性给函数， willSet 和 didSet 观察者一定会被调用。
// 这是由于输入输出形式参数的拷贝入拷贝出存储模型导致的：值一定会在函数结束后写回属性。

func someFunction(stepCounter: inout StepCounter) -> Void {
    stepCounter.totalSteps = 90
}

someFunction(stepCounter: &counter)

// ## 注意: 全局常量和变量永远是延迟计算的，与延迟存储属性有着相同的行为。不同于延迟存储属性，全局常量和变量不需要标记 lazy 修饰符。




// 类型属性 (相当于Objc类方法一个道理，只属于这个类，不属于对象)
// 实例属性是属于特定类型实例的属性。每次你创建这个类型的新实例，它就拥有一堆属性值，与其他实例不同。
//
// 你同样可以定义属于类型本身的属性，不是这个类型的某一个实例(对象)的属性。这个属性只有一个拷贝，无论你创建了多少个类对应的实例。这样的属性叫做类型属性。

// 使用 static 关键字来开一类型属性。对于类类型的计算类型属性，你可以使用 class 关键字来允许子类重写父类的实现。


struct SomeStructure {
    static var sortedTypeProperty = "some value"
}

// 类属性只能有类名使用点语法来访问, 因为类属性不属于对象
print("类属性：\(SomeStructure.sortedTypeProperty)")



// 方法

// 方法关联了特定的函数，类、结构体、枚举都能定义对象方法，方法封装了特定的任务和功能。类、结构体、枚举同样能定义类方法，这是与类本身关联的方法。
// 对象方法和类方法和Objc相似

// ## 枚举添加方法测试
enum Device {
    case iPhone_X, iPhone_8, iPhone_8_plus, iPhone_7, iPhone_7_plus
    
    // 类方法
    static func getSize(deive: Device) -> Size {
        switch deive {
        case .iPhone_7, .iPhone_8:
            return Size(width: 375.0, height: 667.0)
        case .iPhone_7_plus, .iPhone_8_plus:
            return Size(width: 414.0, height: 736.0)
        case .iPhone_X:
            return Size(width: 375.0, height: 812.0)
        default:
            return Size(width: 320.0, height: 568.0)
        }
    }
}

print("\(Device.getSize(deive: Device.iPhone_8_plus))")



// 对象方法: 属于类的实例对象，用实例对象去调用

// 例如：

class NavigationController {
    
}

class ViewController {
    var navigationController: NavigationController?
    
    func viewDidLoad() -> Void {
        print("viewDidLoad")
    }
    
    func viewWillAppear() -> Void {
        print("viewWillAppear")
    }
}

let controller = ViewController()
controller.viewDidLoad()
controller.viewWillAppear()


// 例如：

/// 计数器类
class Counter {
    var count: Int = 0
    
    func increment() {
        count += 1
    }
    
    func increment(by ammout: Int) {
        count += ammout
    }
    
    func reset() -> Void {
        count = 0
    }
}

var c = Counter()
c.increment()
c.increment(by: 9)
print("计数器当前值:\(c.count)")
c.reset()
print("计数器当前值:\(c.count)")


// self 属性
// 相当于Objc中的self指针，self就是当前对象指针，就是当前对象
// self 也可以省略


// 在实例方法中修改值类型
// 结构体和枚举都是值类型，默认情况下，在自身的对象方法中不能修改值类型属性
// 如果要修改就必须在方法前面添加 mutating 修饰

struct Value {
    var value: Int = 0
    
    // 你可以选择在 func关键字前放一个 mutating关键字来使用这个行为
    mutating func update(_ value: Int) -> Void {
//        self.value = value // 没添加mutating 编译错误，Cannot assign to property: 'self' is immutable，意为不能修改值类型属性
        self.value = value  // 添加了 mutating 修饰，就可以修改自身值类型属性了
    }
}

var v = Value()
v.update(8)
print(v.value)


// 在异变方法里指定自身
// 异变方法可以指定整个实例给隐含的 self属性。

// 例如：

enum SwitchState {
    case off, low, high
    
    mutating func next() -> SwitchState {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        default:
            self = .off
        }
        
        return self
    }
    
    static func display(_ state: SwitchState) -> Void {
        if state == SwitchState.off {
            return
        }
        
        print(state)
        
        var stt = state
        self.display(stt.next())
    }
}

SwitchState.display(SwitchState.low)



// 类方法
// 类方法属于这个类，不属于这个类的对象，使用类名去调用
// 你可以通过在 func关键字之前使用 static关键字来明确一个类型方法。类同样可以使用 class关键字来允许子类重写父类对类型方法的实现。
// 类方法中的self指向类本身，对象方法中的self指向对象本身

// 例如：





// 下标


// 类、结构体和枚举可以定义下标，它可以作为访问集合、列表或序列成员元素的快捷方式。你可使用下标通过索引值来设置或检索值而不需要为设置和检索分别使用实例方法。

// 下标的语法
// 下表脚本允许你通过在实例名后面的方括号内写一个或多个值对该类的实例进行查询。它的语法类似于实例方法的计算属性。
// 使用关键字 subscript 来定义下标，并且指定一个或多个输入形式参数和返回类型，与实例方法一样。与实例方法不同的是，下标可以是读写也可以是只读的。
// 这个行为通过与计算属性中相同的 getter 和 setter 传达：

struct List {
    var list: [Int] = Array()
    
    subscript(index: Int) -> Int? {
        get {
            if index > list.count - 1  {
                return nil
            }
            
            return list[index]
        }
        
        set {
            if newValue != nil {
                list[index] = newValue!
            }
        }
    }
}

var table = List(list: [8, 2, 1, 5])
if let value = table[1] {
    print("table[1] = \(value)")
}





















