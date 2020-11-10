//
//  insertion.swift
//  data-structure
//
//  Created by 陈希 on 2020/11/8.
//  Copyright © 2020 chenxi. All rights reserved.
//

import Foundation

class Insertion {

    static func Sort<T: Comparable>(array: inout [T], _ orderCriteria: (T, T) -> Bool) -> [T]  {
        guard array.count > 1 else {
            return array
        }
        let end = array.count
        for x in 1 ..< end {
            var y = x
            while y > 0 {
                if orderCriteria(array[y], array[y - 1]) {
                    array.swapAt(y, y - 1)
                }
                y -= 1
            }
        }
        return array
    }
}
