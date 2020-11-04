//
//  tool.swift
//  data-structue
//
//  Created by peak on 2020/11/4.
//

import Foundation

class Tool {
    static public func RandomInt(_ max: Int) -> Int {
        return Int.random(in: 0...max)
    }
    
    static public func RandomArray(_ min: Int, _ max: Int, _ count: Int) -> [Int] {
        var array = [Int]()
        for _ in 0 ..< count {
            array.append(Int.random(in: min...max))
        }
        return array
    }

    static public func IsOrdered(_ array: [Int]) -> Bool {
        var order = true
        for (index, value) in array.enumerated() {
            if index < array.count - 1 {
                if (value > array[index + 1]) {
                    order = false
                    break
                }
            }
        }
        return order
    }
}
