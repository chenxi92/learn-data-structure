//
//  InsertionSort.swift
//  Stack
//
//  Created by chenxi on 2019/8/13.
//  Copyright © 2019 karma. All rights reserved.
//

import Foundation

class Sort {

    /// 桶排序
    ///
    /// - Parameters:
    ///   - array: 待排序数组
    ///   - bucketSize: 每个桶内元素个数
    func bucketSort(_ array: inout [Int], _ bucketSize: Int) {
        guard array.count > 1 else { return }
        
        let maxValue = array.max()!
        let minValue = array.min()!
        
        let bucketCount = (maxValue - minValue) / bucketSize + 1
        var buckets = Array(repeating: [Int](), count: bucketCount)
        
        for value in array {
            let index = (value - minValue) / bucketSize
            buckets[index].append(value)
        }
        
        array.removeAll()
        for (_, value) in buckets.enumerated() {
//            let result = insertionSort(value, <)
//            for i in 0 ..< result.count {
//                array.append(result[i])
//            }
        }
    }
}

