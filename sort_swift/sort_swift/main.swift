//
//  main.swift
//  sort_swift
//
//  Created by 唯赢 on 2018/5/3.
//  Copyright © 2018年 李立. All rights reserved.
//

import Foundation

let list: [Int] = [2, 6, 1, 8, 3, 10, 5]

func sort(list: Array<Int>, compre:(Int, Int) -> Bool) -> Array<Int>? {
    guard !list.isEmpty else {
        return nil
    }
    
    var sortList = Array(list)
    var i = 0, j = sortList.count - 1   // 下标
    while i <= j {
        
        
        
        
        i += 1
        j -= 1
    }
    
    
    return sortList
}

func compre(_ x: Int, _ y: Int) -> Bool {
    return x > y
}

print(list)
// 开始排序
if let newList = sort(list: list, compre: compre(_:_:)) {
    print(newList)
} else {
    print("排序失败")
}


