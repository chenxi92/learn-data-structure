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
}
