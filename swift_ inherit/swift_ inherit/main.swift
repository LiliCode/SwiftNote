//
//  main.swift
//  swift_ inherit
//
//  Created by 唯赢 on 2018/5/11.
//  Copyright © 2018年 李立. All rights reserved.
//

import Foundation

// # 继承 #

// 一个类可以从其他类继承方法和属性和其他的特性。
// 当一个A类继承自B类，那么A类就是派生类，B类就是基类

// 定义一个基类
// 任何不从另一个类继承的类都是所谓的基类。

class Person {
    var name: String = String()
    var age: Int = 0
    var height: Double = 0.0
    var weight: Double = 0.0
    var description: String  {
        return "name:\(name) age:\(age) height:\(height) weight:\(weight)"
    }
    
    func move(distance: Double) {
        print("移动了\(distance)m")
    }
    
    func eat() {
        print("吃东西")
    }
}

let person = Person()   // 使用初始化器初始化
person.move(distance: 1)
person.eat()


// 子类
// 子类是基于现有类创建新类的行为。子类从现有的类继承了一些特征，你可以重新定义它们。你也可以为子类添加新的特征。
//
// 为了表明子类有父类，要把子类写在父类的前面，用冒号分隔：

class Man: Person { // Man 获得了 Person 的所有特性
    
    func playGames() {  // Man 在 Person 的基础上增加特性
        print("打游戏")
    }
}

let man = Man()
man.move(distance: 2)
man.playGames()


// 重写
// 子类可以提供它自己的实例方法、类型方法、实例属性，类型属性或下标脚本的自定义实现，否则它将会从父类继承。这就所谓的重写。

// 重写方法
// 你可以在你的子类中重写一个继承的实例或类型方法来提供定制的或替代的方法实现。

// 重写属性
// 你可以重写一个继承的实例或类型属性来为你自己的属性提供你自己自定义的 getter 和 setter ，或者添加属性观察器确保当底层属性值改变时来监听重写的属性。



class Boy : Person {
    
    // 重写属性
    override var description: String {
        return "Boy Description:" + super.description
    }
    
    // 重写基类方法，需要在前面添加 override 声明
    override func eat() {
        print("吃糖")
    }
}

let boy = Boy()
boy.name = "Tom"
boy.weight = 8.3
boy.height = 40.5
boy.eat()
print(boy.description)

// 阻止重写
//你可以通过标记为终点来阻止一个方法、属性或者下标脚本被重写。通过在方法、属性或者下标脚本的关键字前写 final 修饰符(比如 final var ， final func ， final class func ， final subscript )。
//
//任何在子类里重写终点方法、属性或下标脚本的尝试都会被报告为编译时错误。你在扩展中添加到类的方法、属性或下标脚本也可以在扩展的定义里被标记为终点。
//
//你可以通过在类定义中在 class 关键字前面写 final 修饰符( final class )标记一整个类为终点。任何想要从终点类创建子类的行为都会被报告一个编译时错误。


final class Girl : Person {
    
}











