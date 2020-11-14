//
//  quick.swift
//  data-structure
//
//  Created by 陈希 on 2020/11/8.
//  Copyright © 2020 chenxi. All rights reserved.
//

import Foundation

class Quick {
    
    static func SortRandom<T: Comparable>(array: inout [T], _ orderCriteria: (T, T) -> Bool) -> [T] {
        guard array.count > 1 else {
            return array
        }
        
        var left = [T]()
        var right = [T]()
        var middle = [T]()
        let value = array.randomElement()
        for item in array {
            if item == value {
                middle.append(item)
            } else if orderCriteria(item, value!) {
                left.append(item)
            } else {
                right.append(item)
            }
        }
        
        return Quick.SortRandom(array: &left, orderCriteria) + middle + Quick.SortRandom(array: &right, <)
    }
    
    static func SortLomuto<T: Comparable>(_ array: inout [T]) -> [T] {
        SortLomuto(&array, 0, array.count - 1)
        return array
    }
    
    static private func SortLomuto<T: Comparable>(_ array: inout [T], _ low: Int, _ high: Int) {
        if low < high {
            let p = partitionLomuto(&array, low: low, high: high)
            SortLomuto(&array, low, p - 1)
            SortLomuto(&array, p + 1, high)
        }
    }
    
    static private func partitionLomuto<T: Comparable>(_ array: inout [T], low: Int, high: Int) -> Int {
        let pivot = array[high]
        /// 记录基准值的位置，从前往后扫描
        var i = low
        for j in low ..< high {
            if array[j] <= pivot {
                if (i != j) {
                    array.swapAt(j, i)
                }
                i += 1
            }
        }
        array.swapAt(i, high)
        return i
    }
    
    static func Sort<T: Comparable>(_ array: inout [T]) -> [T] {
        partitionLeftRight(&array, low: 0, high: array.count - 1)
        return array
    }
    
    static private func partitionLeftRight<T: Comparable>(_ array: inout [T], low: Int, high: Int) {
        guard high >= low else {
            return
        }
        
        var left = low
        var right = high
        let pivot = array[left]
        while left < right {
            while (left < right && array[right] >= pivot) {
                right -= 1
            }
            if left < right {
                array[left] = array[right]
                left += 1
            }
            while (left < right && array[left] <= pivot) {
                left += 1
            }
            if left < right {
                array[right] = array[left]
                right -= 1
            }
        }
        array[left] = pivot
        
        partitionLeftRight(&array, low: low, high: left - 1)
        partitionLeftRight(&array, low: left + 1, high: high)
    }
    
    static func TestRandom() {
        print("\nQuick sort random test begin")
        let max = Int.random(in: 25...100)
        for _ in 0 ..< max {
            let count = Int.random(in: 15...60)
            var source = Tool.RandomArray(0, 100, count)
            let result = Quick.SortRandom(array: &source, <)
            if !Tool.IsAscend(result) {
                print("Quick sort random source = \n", source)
                print("Quick sort random result = \n", result)
                assert(false, "Quick sort random valid")
            }
        }
        print("Quick sort random test success \(max) times.")
    }
    
    static func TestLomuto() {
        print("\nQuick sort lomuto test begin")
        let max = Int.random(in: 25...100)
        for _ in 0 ..< max {
            let count = Int.random(in: 15...60)
            var source = Tool.RandomArray(0, 100, count)
            let result = Quick.SortLomuto(&source)
            if !Tool.IsAscend(result) {
                print("Quick sort lomuto source = \n", source)
                print("Quick sort lomuto result = \n", result)
                assert(false, "Quick sort lomuto valid")
            }
        }
        print("Quick sort lomuto test success \(max) times.")
    }
    
    static func TestPartitionLeftRight() {
        print("\nQuick sort partition test begin")
//        var source = [8, 3, 10, 2, 7, 6, 9, 12]
//        print(Quick.Sort(&source))
        let max = Int.random(in: 25...100)
        for _ in 0 ..< max {
            let count = Int.random(in: 15...60)
            var source = Tool.RandomArray(0, 100, count)
            let result = Quick.Sort(&source)
            if !Tool.IsAscend(result) {
                print("Quick sort partition source = \n", source)
                print("Quick sort partition result = \n", result)
                assert(false, "Quick sort partition valid")
            }
        }
        print("Quick sort partition test success \(max) times.")
    }
}
