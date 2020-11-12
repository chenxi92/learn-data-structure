//
//  merge.swift
//  data-structure
//
//  Created by peak on 2020/11/12.
//  Copyright © 2020 chenxi. All rights reserved.
//

import Foundation

class Merge {
    
    static public func SortUpToDown<T: Comparable>(array: inout [T], _ orderCriteria:(T, T) -> Bool) -> [T] {
        guard array.count > 1 else {
            return array
        }
        Sort(array: &array, low: 0, high: array.count - 1, orderCriteria: orderCriteria)
        return array
    }
    
    static private func Sort<T: Comparable>(array: inout [T], low: Int, high: Int, orderCriteria:(T, T) -> Bool) {
        guard high > low else {
            return
        }
        
        let mid = low + (high - low)/2
        Sort(array: &array, low: low, high: mid, orderCriteria: orderCriteria)
        Sort(array: &array, low: mid + 1, high: high, orderCriteria: orderCriteria)
        Merge(array: &array, low: low, mid: mid, high: high, orderCriteria: orderCriteria)
    }
    
    /// 原地归并的抽象方法
    static private func Merge<T: Comparable>(array: inout [T], low: Int, mid: Int, high: Int, orderCriteria: (T, T) -> Bool) {
        var left = low
        var right = mid + 1
        var aux = [T]()
        for k in low ... high {
            aux.append(array[k])
        }
        for k in low ... high {
            guard (left < aux.count && right < aux.count)  else {
                break
            }
            if (left > mid) { // 左半部分元素取完
                array[k] = aux[right]
                right += 1
            } else if (right > high) { // 右半部分元素取完
                array[k] = aux[left]
                left += 1
            } else if aux[right] > aux[left] {
                array[k] = aux[right]
                right += 1
            } else {
                array[k] = aux[left]
                left += 1
            }
        }
    }
    
    static private func Merge<T: Comparable>(_ leftArray: [T], _ rightArray: [T]) -> [T]
    {
        var sortedArray = [T]()
        var l = 0, r = 0
        while l < leftArray.count && r < rightArray.count {
            if leftArray[l] > rightArray[r] {
                sortedArray.append(leftArray[l])
                l += 1
            } else if leftArray[l] < rightArray[r] {
                sortedArray.append(rightArray[r])
                r += 1
            } else {
                sortedArray.append(leftArray[l])
                l += 1
                sortedArray.append(rightArray[r])
                r += 1
            }
        }
        return sortedArray
    }
    
    static func Test() {
        print("\nMerge sort up to down test begin")
        let max = Int.random(in: 25...100)
//        for _ in 0 ..< max {
            let count = Int.random(in: 15...60)
            var source = Tool.RandomArray(0, 100, count)
            let result = SortUpToDown(array: &source, <)
            if !Tool.IsAscend(result) {
                print("Merge sort up to down source = \n", source)
                print("Merge sort up to down result = \n", result)
                assert(false, "Heap sort2 valid")
            }
//        }
        print("Merge sort up to down test success \(max) times.")
    }
}
