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
        
        return array
    }
    
    static func Test() {
        print("\nQuick sort test begin")
        let max = Int.random(in: 10...20)
        for _ in 0 ..< max {
            var source = Tool.RandomArray(0, 100, 20)
            let result = Insertion.Sort(array: &source, <)
            if !Tool.IsAscend(result) {
                print("Quick sort source = \n", source)
                print("Quick sort result = \n", result)
                assert(false, "Quick sort valid")
            }
        }
        print("Quick sort test success \(max) times.")
    }
}
