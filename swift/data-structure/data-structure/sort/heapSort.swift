//
//  heapSort.swift
//  data-structue
//
//  Created by peak on 2020/11/4.
//

import Foundation

class HeapSort {
    
    /// heap sort from min to max
    static func Sort1<T: Comparable>(_ array: [T], _ orderCriteria:@escaping (T, T) -> Bool) -> [T] {
        var minHeap = Heap(array: array, sort: orderCriteria)
        var newArray = [T]()
        while minHeap.peak() != nil {
            guard let value = minHeap.remove() else {
                return newArray
            }
            newArray.append(value)
        }
        return newArray
    }
    
    static func Sort2<T: Comparable>( array: inout [T], _ orderCriteria:(T, T) -> Bool) -> [T] {
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
    
    static func Test() {
        print("\nHeap sort1 test begin")
        let max = Int.random(in: 25...100)
        for _ in 0 ..< max {
            let count = Int.random(in: 15...60)
            let source = Tool.RandomArray(0, 100, count)
            let result = HeapSort.Sort1(source, <)
            if !Tool.IsAscend(result) {
                print("Heap sort1 source = \n", source)
                print("Heap sort1 result = \n", result)
                assert(false, "Heap sort1 valid")
            }
        }
        print("Heap sort1 test success \(max) times.")
    }
    
    static func Test1() {
        print("\nHeap sort2 test begin")
        let max = Int.random(in: 25...100)
        for _ in 0 ..< max {
            let count = Int.random(in: 15...60)
            var source = Tool.RandomArray(0, 100, count)
            let result = HeapSort.Sort2(array: &source, <)
            if !Tool.IsAscend(result) {
                print("Heap sort2 source = \n", source)
                print("Heap sort2 result = \n", result)
                assert(false, "Heap sort2 valid")
            }
        }
        print("Heap sort2 test success \(max) times.")
    }
}
