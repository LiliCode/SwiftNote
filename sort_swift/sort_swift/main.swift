//
//  main.swift
//  sort_swift
//
//  Created by 唯赢 on 2018/5/3.
//  Copyright © 2018年 李立. All rights reserved.
//

import Foundation

let list: [Int] = [40, 20, 12, 1, 59, 36, 47, 90, 23, 26, 32]

func sort(list: Array<Int>) -> Array<Int>? {
    guard !list.isEmpty else {
        return nil
    }
    
    var sortList = Array(list)
    let i = 0, j = sortList.count - 1   // 下标
    // 快排
    quickSort(list: &sortList, iIndex: i, jIndex: j)
    
    return sortList
}

func quickSort(list: inout [Int], iIndex: Int, jIndex: Int) -> Void {
    if iIndex >= jIndex || list.count <= 1 {
        return  // 递归结束条件
    }
    
    let baseValue = list[iIndex]
    var i = iIndex, j = jIndex
    while i < j {
        // 先让j哨兵先走
        while i < j {
            if list[j] < baseValue {
                break   // 找到比基准数小的数
            }
            
            j -= 1
        }
        // i哨兵移动
        while i < j {
            if list[i] > baseValue {
                break   // 找到比基准数大的数
            }
            
            i += 1
        }
        
        list.swapAt(i, j)   // 交换两个数
    }
    
    if i == j { // 两个哨兵相遇了，把相遇的数和基准数交换位置
        list.swapAt(iIndex, i)
    }
    
//    print("i = \(iIndex) j = \(jIndex)")
    
    quickSort(list: &list, iIndex: iIndex, jIndex: i)    // 左
    quickSort(list: &list, iIndex: i + 1, jIndex: jIndex) // 右
}

func compre(_ x: Int, _ y: Int) -> Bool {
    return x > y
}

print(list)
// 开始排序
if let newList = sort(list: list) {
    print(newList)
} else {
    print("排序失败")
}


