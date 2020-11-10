//
//  quick.swift
//  data-structure
//
//  Created by 陈希 on 2020/11/8.
//  Copyright © 2020 chenxi. All rights reserved.
//

import Foundation

class Quick {
    
    static func Sort<T: Comparable>(array: inout [T], _ orderCriteria: (T, T) -> Bool) -> [T] {
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
        
        return Quick.Sort(array: &left, orderCriteria) + middle + Quick.Sort(array: &right, <)
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
        var pivotIndex = low
        for j in low ..< high {
            if array[j] <= pivot {
                array.swapAt(j, pivotIndex)
                pivotIndex += 1
            }
        }
        array.swapAt(pivotIndex, high)
        return pivotIndex
    }
    
    
    static func Test1() {
        print("\nQuick sort test begin")
        let max = Int.random(in: 25...100)
        for _ in 0 ..< max {
            let count = Int.random(in: 15...60)
            var source = Tool.RandomArray(0, 100, count)
            let result = Quick.Sort(array: &source, <)
            if !Tool.IsAscend(result) {
                print("Quick sort source = \n", source)
                print("Quick sort result = \n", result)
                assert(false, "Quick sort valid")
            }
        }
        print("Quick sort test success \(max) times.")
    }
    
    static func Test2() {
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
}
