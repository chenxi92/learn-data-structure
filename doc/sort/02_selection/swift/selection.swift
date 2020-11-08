//
//  selection.swift
//  data-structure
//
//  Created by 陈希 on 2020/11/8.
//  Copyright © 2020 chenxi. All rights reserved.
//

import Foundation

class Selection {
    
    static func Sort<T: Comparable>(array: inout [T], _ orderCriteria: (T, T) -> Bool) -> [T] {
        guard array.count > 1 else { return array }
        let end = array.count
        for x in 0 ..< end {
            // 找到 最小/大 元素的下标
            var position = x
            for y in x + 1 ..< end {
                if orderCriteria(array[y], array[position]) {
                    position = y
                }
            }
            if x != position {
                array.swapAt(x, position)
            }
        }
        return array
    }
}
