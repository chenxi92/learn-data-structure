//
//  InsertionSort.swift
//  Stack
//
//  Created by chenxi on 2019/8/13.
//  Copyright © 2019 karma. All rights reserved.
//

import Foundation


class Sort {
    
    /// - 来源: https://github.com/raywenderlich/swift-algorithm-club/blob/master/Merge%20Sort/README.markdown
    /// - https://www.cnblogs.com/nullzx/p/5968170.html
    
    // 自顶向下实现
    func mergeSortTopDown<T: Comparable>(_ array: [T]) -> [T] {
        // 1 退出递归条件
        guard array.count > 1 else { return array }
        
        let middleIndex = array.count / 2
        
        let leftArray = mergeSortTopDown(Array(array[0..<middleIndex]))
        let rightArray = mergeSortTopDown(Array(array[middleIndex..<array.count]))
        
        return merge(leftPile: leftArray, rightPile: rightArray)
    }
    
    func merge<T: Comparable>(leftPile: [T], rightPile: [T]) -> [T] {
        // both left and right are sorted.

        var orderdPile = [T]()
        orderdPile.reserveCapacity(leftPile.count + rightPile.count)
        
        var leftIndex = 0
        var rightIndex = 0
        
        while leftIndex < leftPile.count && rightIndex < rightPile.count {
            if leftPile[leftIndex] < rightPile[rightIndex] {
                orderdPile.append(leftPile[leftIndex])
                leftIndex += 1
            } else if leftPile[leftIndex] > rightPile[rightIndex] {
                orderdPile.append(rightPile[rightIndex])
                rightIndex += 1
            } else {
                orderdPile.append(leftPile[leftIndex])
                leftIndex += 1
                orderdPile.append(rightPile[rightIndex])
                rightIndex += 1
            }
        }
        
        
        while leftIndex < leftPile.count {
            orderdPile.append(leftPile[leftIndex])
            leftIndex += 1
        }

        while rightIndex < rightPile.count {
            orderdPile.append(rightPile[rightIndex])
            rightIndex += 1
        }
        
        return orderdPile
    }
    
    // Bottom-up implementation
    func mergeSortBottomUp<T>(_ a: [T], _ isOrderedBefore: (T, T) -> Bool) -> [T] {
        let n = a.count
        
        var z = [a, a]      // 1
        var d = 0
        
        var width = 1
        while width < n {   // 2
            
            var i = 0
            while i < n {     // 3
                
                var j = i
                var l = i
                var r = i + width
                
                let lmax = min(l + width, n)
                let rmax = min(r + width, n)
                
                while l < lmax && r < rmax {                // 4
                    if isOrderedBefore(z[d][l], z[d][r]) {
                        z[1 - d][j] = z[d][l]
                        l += 1
                    } else {
                        z[1 - d][j] = z[d][r]
                        r += 1
                    }
                    j += 1
                }
                while l < lmax {
                    z[1 - d][j] = z[d][l]
                    j += 1
                    l += 1
                }
                while r < rmax {
                    z[1 - d][j] = z[d][r]
                    j += 1
                    r += 1
                }
                
                i += width*2
            }
            
            width *= 2
            d = 1 - d      // 5
        }
        return z[d]
    }
    
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
            print(index)
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

