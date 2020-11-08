//
//  insertion.swift
//  data-structure
//
//  Created by 陈希 on 2020/11/8.
//  Copyright © 2020 chenxi. All rights reserved.
//

import Foundation

class Insertion {
    /// 插入排序
    ///
    /// - Parameters:
    ///   - array: 待排序数组
    ///   - orderCriteria: 排序方法
    /// - Returns: 已经排序数组
    /// - 复杂度: 时间复杂度 O(n^2), 空间复杂度 O(1)
    /// - 来源: https://en.wikipedia.org/wiki/Insertion_sort
    /// - 维基百科: https://aquarchitect.github.io/swift-algorithm-club/Insertion%20Sort/
    static func Sort<T: Comparable>(array: inout [T], _ orderCriteria: (T, T) -> Bool) -> [T]  {
        guard array.count > 1 else {
            return array
        }
        let end = array.count
        for x in 1 ..< end {
            var y = x
            while y > 0 {
                if orderCriteria(array[y], array[y - 1]) {
                    array.swapAt(y, y - 1)
                }
                y -= 1
            }
        }
        return array
    }
    
    static func Test() {
        print("\nInsertion sort test begin")
        let max = Int.random(in: 10...20)
        for _ in 0 ..< max {
            var source = Tool.RandomArray(0, 100, 20)
            let result = Insertion.Sort(array: &source, <)
            if !Tool.IsAscend(result) {
                print("insertion sort source = \n", source)
                print("insertion sort result = \n", result)
                assert(false, "insertion sort valid")
            }
        }
        print("Insertion sort test success \(max) times.")
    }
}
