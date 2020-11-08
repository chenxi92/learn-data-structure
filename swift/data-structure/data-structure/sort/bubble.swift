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
    
    static func Test() {
        print("\nBubble sort test begin")
        let max = Int.random(in: 10...20)
        for _ in 0 ..< max {
            var source = Tool.RandomArray(0, 100, 20)
            let result = Bubble.Sort(array: &source, <)
            if !Tool.IsAscend(result) {
                print("bubble sort source = \n", source)
                print("bubble sort result = \n", result)
                assert(false, "bubble sort valid")
            }
        }
        print("Bubble sort test success \(max) times.")
    }
}
