//
//  Counting.swift
//  data-structure
//
//  Created by 陈希 on 2020/11/26.
//  Copyright © 2020 chenxi. All rights reserved.
//

import Foundation

/// 缺点：
/// 只能对整数排序
class CountingSort {
    
    
    static func Sort1(_ array: inout [Int]) {
        /// 找出元素的最大值
        var max = array[0]
        for item in array {
            if item > max {
                max = item
            }
        }
        
        /// 分配存储空间
        var countsArray: [Int] = [Int](repeating: 0, count: max + 1)
        
        /// 统计每个元素出现次数
        for i in 0 ..< array.count {
            let value = array[i]
            countsArray[value] += 1
        }
        
        /// 根据元素出现的次数，对数组进行排序
        var index = 0
        for element in 0 ..< countsArray.count {
            ///元素出现次数
            var counts = countsArray[element]
            while counts > 0 {
                array[index] = element
                index += 1
                counts -= 1
            }
        }
    }
    
    static func Sort2(_ array: [Int]) -> [Int] {
        let max = array.max() ?? 0
        var countsArray = [Int](repeating: 0, count: max + 1)
        for element in array {
            countsArray[element] += 1
        }
        for i in Range(1...max) {
            countsArray[i] += countsArray[i - 1]
        }
        var sortedArray = [Int](repeating: 0, count: array.count)
        for element in array {
            countsArray[element] -= 1
            sortedArray[countsArray[element]] = element
        }
        return sortedArray
    }
    
    static func Test1() {
        print("\nCounting sort1 test begin")
        let max = Int.random(in: 25...100)
        for _ in 0 ..< max {
            let count = Int.random(in: 15...60)
            var source = Tool.RandomArray(0, 100, count)
            CountingSort.Sort1(&source)
            if !Tool.IsAscend(source) {
                print("Counting sort = \n", source)
                assert(false, "Counting sort valid")
            }
        }
        print("Counting sort1 test success \(max) times.")
    }
    
    static func Test2() {
        print("\nCounting sort2 test begin")
        let max = Int.random(in: 25...100)
        for _ in 0 ..< max {
            let count = Int.random(in: 15...60)
            let source = Tool.RandomArray(0, 100, count)
            let result = CountingSort.Sort2(source)
            if !Tool.IsAscend(result) {
                print("Counting sort = \n", result)
                assert(false, "Counting sort valid")
            }
        }
        print("Counting sort2 test success \(max) times.")
    }
}
