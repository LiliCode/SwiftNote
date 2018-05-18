//
//  main.swift
//  swift_内嵌类型
//
//  Created by 唯赢 on 2018/5/16.
//  Copyright © 2018年 李立. All rights reserved.
//

import Foundation

// # 内嵌类型 #

// 相当于其他语言的嵌套类，内部类
// 在一个类体中定义的类叫作嵌套类。拥有嵌套类的类叫外围类。

// Swift 允许你定义内嵌类型，借此在支持类型的定义中嵌套枚举、类火结构体
// 若要在一种类型中嵌套另一种类型，再起支持类型的大括号内定义即可。可以根据需求多级嵌套数个类型。

// 示例

class NetTools {
    class NetworkingService {
        var timeout: Double = 10
        
        enum RequestMethad {
            case GET, POST, PUT, PATCH, DELETE
        }
        
        @discardableResult
        func request(methad: RequestMethad, url: String?, parameter: [String:Any]?, header: [String:Any]?, response:(((Int, String), [String:Any]) -> Void)?) -> Bool {
            
            print("Request methad: \(methad)")
            
            if let urlString = url {
                print("Url: \(urlString)")
            }
            
            if let pars = parameter {
                print("Parameter: \(pars)")
            }
            
            if let headerDic = header {
                print("Header: \(headerDic)")
            }
            
            if let callback = response {
//                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    callback((0,"无错误"), ["uid":"11008", "userName":"lili", "phone":"18281863522"])
//                }
            }
            
            return true
        }
    }
    
    class Secuity {
        
    }
    
    class Common {
        
    }
}

// 引用内嵌类型
// 要在定义外部使用内嵌类型，只需在其前缀加上内嵌了它的类的类型名即可：
let service = NetTools.NetworkingService()
service.request(methad: .GET, url: "http://www.ehuu.com/user?", parameter: ["uid":"11008", "token":"1AC21DF5B97546CB1EA3F"], header: ["plantform":"ios"]) { (error, response) in
    print("Response: \(response)")
}








