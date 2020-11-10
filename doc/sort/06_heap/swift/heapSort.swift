//
//  heapSort.swift
//  data-structue
//
//  Created by peak on 2020/11/4.
//

import Foundation

class HeapSort {
    
    static func Sort<T: Comparable>( array: inout [T], _ orderCriteria:(T, T) -> Bool) -> [T] {
        guard array.count > 1 else {
            return array
        }
        
        HeapSort.BuildHeap(array: &array, orderCriteria)
        
        var size = array.count
        for i in stride(from: array.count - 1, through: 0, by: -1) {
            array.swapAt(i, 0)
            size -= 1
            HeapShiftDown(array: &array, 0, size, orderCriteria)
        }
        return array
    }
    
    static private func BuildHeap<T: Comparable>(array: inout [T],  _ orderCriteria:(T, T) -> Bool) {
        for level in stride(from: array.count/2 - 1, through: 0, by: -1) {
            HeapShiftDown(array: &array, level, array.count, orderCriteria)
        }
    }
    
    static private func HeapShiftDown<T: Comparable>(array: inout [T], _ parentIndex: Int, _ size: Int, _ orderCriteria: (T, T) -> Bool)
    {
        let left = parentIndex*2 + 1
        let right = left + 1
        var first = parentIndex
        if left < size && orderCriteria(array[first], array[left]) {
            first = left
        }
        if right < size && orderCriteria(array[first], array[right]) {
            first = right
        }
        if first == parentIndex {
            return
        }
        array.swapAt(parentIndex, first)
        HeapShiftDown(array: &array, first, size, orderCriteria)
    }
}
