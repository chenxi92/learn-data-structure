//
//  bubble.swift
//  data-structure
//
//  Created by 陈希 on 2020/11/8.
//  Copyright © 2020 chenxi. All rights reserved.
//

import Foundation

class Bubble {
    
    static func Sort<T: Comparable>(array: inout [T], _ orderCriteria:(T, T) -> Bool) -> [T] {
        for end in stride(from: array.count - 1, through: 1, by: -1) {
            for begin in 1 ... end {
                if orderCriteria(array[begin], array[begin - 1]) {
                    array.swapAt(begin, begin - 1)
                }
            }
        }
        
        return array
    }
    
    static func Sort1<T: Comparable>(array: inout [T], _ orderCriteria:(T, T) -> Bool) {
        /// loop times: n - 1
        for loop in stride(from: 0, to: array.count - 1, by: 1) {
            
            var hasSwapped: Bool = false
            
            for pair in stride(from: 0, to: array.count - 1 - loop, by: 1) {
                if orderCriteria(array[pair + 1], array[pair]) {
                    array.swapAt(pair, pair + 1)
                    hasSwapped = true
                }
            }
            
            if !hasSwapped  {
                break
            }
        }
    }
    
    static func Test() {
        print("\nBubble sort test begin")
        let max = Int.random(in: 25...100)
        for _ in 0 ..< max {
            let count = Int.random(in: 15...60)
            var source = Tool.RandomArray(0, 100, count)
            let result = Bubble.Sort(array: &source, <)
            if !Tool.IsAscend(result) {
                print("bubble sort source = \n", source)
                print("bubble sort result = \n", result)
                assert(false, "bubble sort valid")
            }
        }
        print("Bubble sort test success \(max) times.")
    }
    
    static func TestOptimistion() {
        print("\nBubble sort optimistion test begin")
        let max = Int.random(in: 25...100)
        for _ in 0 ..< max {
            let count = Int.random(in: 15...60)
            var source = Tool.RandomArray(0, 100, count)
            Bubble.Sort1(array: &source, <)
            if !Tool.IsAscend(source) {
                print("bubble sort result = \n", source)
                assert(false, "bubble sort valid")
            }
        }
        print("Bubble sort optimistion test success \(max) times.")
    }
}
