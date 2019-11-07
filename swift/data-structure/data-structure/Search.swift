//
//  Search.swift
//  Stack
//
//  Created by chenxi on 2019/8/13.
//  Copyright © 2019 karma. All rights reserved.
//

import Foundation

class Search {
    
    /// 递归二分查找法
    ///
    /// - Parameters:
    ///   - a: 有序数组
    ///   - key: 查找元素
    ///   - range: 查找范围
    /// - Returns: 待查找元素在有序数组中的索引
    /// - Discusstion: 平均时间复杂度 O(log n), 空间复杂度 O(log n)
    func binarySearch<T: Comparable>(_ a: [T], key: T, range:Range<Int>) -> Int? {
        if range.lowerBound >= range.upperBound {
            return nil
        } else {
            // Many implementations of binary search calculate midIndex = (lowerBound + upperBound) / 2.
            // This contains a subtle bug that only appears with very large arrays, because lowerBound + upperBound may overflow the maximum number an integer can hold.
            // This situation is unlikely to happen on a 64-bit CPU, but it definitely can on 32-bit machines.
            let midIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
            
            if a[midIndex] > key {
                return binarySearch(a, key: key, range: range.lowerBound ..< midIndex)
            } else if a[midIndex] < key {
                return binarySearch(a, key: key, range: midIndex + 1 ..< range.upperBound)
            } else {
                return midIndex
            }
        }
    }
    
    /// 二分查找法
    ///
    /// - Parameters:
    ///   - a: 有序数组
    ///   - key: 查找元素
    /// - Returns: 待查找元素在有序数组中的索引
    /// - 复杂度: 平均时间复杂度 O(log n), 空间复杂度 O(1)
    /// - 来源: https://github.com/raywenderlich/swift-algorithm-club/tree/master/Binary%20Search
    /// - 维基百科: https://en.wikipedia.org/wiki/Binary_search_algorithm
    func binarySearch<T: Comparable>(_ a: [T], key: T) -> Int? {
        var lowerBound = 0
        var upperBound = a.count
        while lowerBound < upperBound {
            let midIndex = lowerBound + (upperBound - lowerBound) / 2
            if a[midIndex] == key {
                return midIndex
            } else if a[midIndex] < key {
                // 右侧数组
                lowerBound = midIndex + 1
            } else {
                // 左侧数组
                upperBound = midIndex
            }
        }
        return nil
    }
    
    func countOccurrences<T: Comparable>(of key: T, in array: [T]) -> Int {
        var leftBoundary: Int {
            var low = 0
            var high = array.count
            while low < high {
                let midIndex = low + (high - low)/2
                if array[midIndex] < key {
                    low = midIndex + 1
                } else {
                    high = midIndex
                }
            }
            return low
        }

        var rightBoundary: Int {
            var low = 0
            var high = array.count
            while low < high {
                let midIndex = low + (high - low)/2
                if array[midIndex] > key {
                    high = midIndex
                } else {
                    low = midIndex + 1
                }
            }
            return low
        }
        return rightBoundary - leftBoundary
    }
}
