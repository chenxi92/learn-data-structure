//
//  Radix.swift
//  data-structure
//
//  Created by 陈希 on 2020/11/29.
//  Copyright © 2020 chenxi. All rights reserved.
//

import Foundation

class Radix {
    
    static func Sort(_ array: inout [Int]) -> [Int] {
        guard array.count > 0 else {
            return array
        }
        var max = array[0]
        for element in array {
            if element > max {
                max = element
            }
        }
        
        var diviler = 1
        while diviler <= max {
            countingSort(diviler, &array)
            diviler *= 10
        }
        
        return array
    }
    
    static func countingSort(_ diviler: Int, _ array: inout [Int]) {
        // initialized the countsArray
        var countsArray = [Int](repeating: 0, count: 10)
        
        // caculate counts value
        for element in array {
            let index = element / diviler % 10
            countsArray[index] += 1
        }
        
        // sum all the counts
        for i in 1 ..< countsArray.count {
            countsArray[i] += countsArray[i - 1]
        }
        
        var newArray = [Int](repeating: 0, count: array.count)
        var i = array.count - 1
        while i >= 0 {
            let index = array[i] / diviler % 10
            countsArray[index] -= 1
            newArray[countsArray[index]] = array[i]
            i -= 1
        }
        
        for i in 0..<array.count
        {
            array[i] = newArray[i]
        }
    }
    
    static func Test() {
        print("\nRadix sort test begin")
        let max = Int.random(in: 25...100)
        for _ in 0 ..< max {
            let count = Int.random(in: 15...60)
            var source = Tool.RandomArray(0, 100, count)
            let result = Radix.Sort(&source)
            if !Tool.IsAscend(result) {
                print("Radix sort = \n", result)
                assert(false, "Radix sort valid")
            }
        }
        print("Radix sort test success \(max) times.")
    }
}
