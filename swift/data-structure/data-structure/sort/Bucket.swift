//
//  Bucket.swift
//  data-structure
//
//  Created by 陈希 on 2020/11/29.
//  Copyright © 2020 chenxi. All rights reserved.
//

import Foundation

class Bucket {
    static func Sort(_ array: inout[Int], _ bucketSize: Int) -> [Int] {
        guard array.count > 1 else { return array }
        
        let maxValue = array.max()!
        let minValue = array.min()!
        
        let bucketCount = (maxValue - minValue) / bucketSize + 1
        var buckets = Array(repeating: [Int](), count: bucketCount)
        
        for value in array {
            let index = (value - minValue) / bucketSize
            buckets[index].append(value)
        }
        
        array.removeAll()
        for (_, var values) in buckets.enumerated() {
            let result = Insertion.Sort(array: &values, <)
            for i in 0 ..< result.count {
                array.append(result[i])
            }
        }
        return array
    }
    
    static func Test() {
        print("\nBucket sort test begin")
        let max = Int.random(in: 25...100)
        for _ in 0 ..< max {
            let count = Int.random(in: 15...60)
            var source = Tool.RandomArray(0, 100, count)
            let result = Bucket.Sort(&source, count)
            if !Tool.IsAscend(result) {
                print("Radix sort = \n", result)
                assert(false, "Radix sort valid")
            }
        }
        print("Bucket sort test success \(max) times.")
    }
}
