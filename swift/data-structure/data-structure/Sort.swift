//
//  InsertionSort.swift
//  Stack
//
//  Created by chenxi on 2019/8/13.
//  Copyright © 2019 karma. All rights reserved.
//

import Foundation

class Sort {

    func countingSort(_ array: [Int]) -> [Int] {
        let maxElement = array.max() ?? 0
        
        var countArray = [Int](repeating: 0, count: (maxElement + 1))
        for element in array {
            countArray[element] += 1
        }
        
        for index in 1..<countArray.count {
            let sum = countArray[index] + countArray[index - 1]
            countArray[index] = sum
        }
        
        var sortedArray = [Int](repeating: 0, count: array.count)
        for element in array {
            countArray[element] -= 1
            let index = countArray[element]
//            print(index)
            sortedArray[index] = element
        }
        
        return sortedArray
    }
    
    
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

