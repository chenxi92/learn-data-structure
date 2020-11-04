//
//  heapSort.swift
//  data-structue
//
//  Created by peak on 2020/11/4.
//

import Foundation

class heapSort<T: Comparable> {
    /// heap sort from min to max
    static func Sort(_ array: [T]) -> [T] {
        var minHeap = Heap(array: array, sort: <)
        var newArray = [T]()
        while minHeap.peak() != nil {
            guard let value = minHeap.remove() else {
                return newArray
            }
            newArray.append(value)
        }
        return newArray
    }
}
