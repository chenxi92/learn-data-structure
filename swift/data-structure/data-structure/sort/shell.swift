//
//  shell.swift
//  data-structure
//
//  Created by 陈希 on 2020/11/8.
//  Copyright © 2020 chenxi. All rights reserved.
//

import Foundation

class Shell {
    static func Sort<T: Comparable>(array: inout [T], _ orderCriteria: (T, T) -> Bool) -> [T] {
        guard array.count > 1 else {
            return array
        }
        let count = array.count
        var gap = count/3
        while gap > 0 {
            for (i, element) in array.enumerated() {
                var begin = i
                while (begin >= gap) && orderCriteria(element, array[begin - gap]) {
                    array.swapAt(begin, begin - gap)
                    begin -= gap
                }
            }
            if gap == 2 {
                gap = 1
            } else {
                gap /= 3
            }
        }
        return array
    }
        
    static func Test() {
        print("\nShell sort test begin")
        let max = Int.random(in: 10...20)
        for _ in 0 ..< max {
            var source = Tool.RandomArray(0, 30, 8)
            let result = Shell.Sort(array: &source, <)
            if !Tool.IsAscend(result) {
                print("shell sort source =\n", source)
                print("shell sort result =\n", result)
                assert(false, "shell sort valid")
            }
        }
        print("Shell sort test success \(max) times.")
    }
}
