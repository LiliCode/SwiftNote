//
//  main.swift
//  sokoban-core-swift
//
//  Created by 唯赢 on 2018/5/2.
//  Copyright © 2018年 李立. All rights reserved.
//

import Foundation


/// 地图类型
typealias MapType = [[Int8]]


/// 初始化一个二维数组
///
/// - Parameters:
///   - row: 数组行数
///   - col: 数组列数
func initMap(row: Int8, col: Int8) -> MapType {
    var map: MapType = []
    for row in 0..<row {
        var rows: [Int8] = []
        for col in 0..<col {
            rows.insert(0, at: Int(col))
        }
        map .insert(rows, at: Int(row))
    }
    
    return map
}

func showMap(map: MapType) {
    for rows in map {
        print(rows)
    }
}







func main(argc: Int, argv: [Character]?) -> Int {
    let mapArray = initMap(row: 8, col: 8)
    showMap(map: mapArray)
    
    return 0
}

// 执行main函数
let ret = main(argc: 0, argv: nil)




