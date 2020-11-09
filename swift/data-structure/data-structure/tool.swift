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
        while array.count < count {
            let value = Int.random(in: min...max)
            if array.firstIndex(of: value) == nil {
                array.append(value)
            }
        }
        return array
    }

    static public func IsAscend(_ array: [Int]) -> Bool {
        var ordered = true
        for (index, value) in array.enumerated() {
            if index + 1 < array.count {
                if (value > array[index + 1]) {
                    ordered = false
                    break
                }
            }
        }
        return ordered
    }
    
    static public func IsDescend(_ array: [Int]) -> Bool {
        var ordered = true
        for (index, value) in array.enumerated() {
            if index < array.count - 1 {
                if (value < array[index + 1]) {
                    ordered = false
                    break
                }
            }
        }
        return ordered
    }
}
