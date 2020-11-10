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
        
        return array
    }
    
    static private func BuildHeap<T: Comparable>(array: inout [T],  _ orderCriteria:(T, T) -> Bool) {
        for level in stride(from: array.count/2, through: 0, by: -1) {
            print("heapify level: \(level) \(array)")
            Heapify(array: &array, level, array.count, orderCriteria)
        }
    }
    
    static private func Heapify<T: Comparable>(array: inout [T], _ parentIndex: Int, _ size: Int, _ orderCriteria: (T, T) -> Bool)
    {
        let left = parentIndex*2
        let right = left + 1
        var first = parentIndex
        if left < size && orderCriteria(array[left], array[parentIndex]) {
            first = left
        }
        if right < size && orderCriteria(array[right], array[parentIndex]) {
            first = right
        }
        if first == parentIndex {
            return
        }
        print("\(parentIndex)<->\(first) ", array)
        array.swapAt(parentIndex, first)
        Heapify(array: &array, first, size, orderCriteria)
    }
    
    static func Test() {
        print("\nHeap sort test begin")
        let max = Int.random(in: 25...100)
        for _ in 0 ..< max {
            let count = Int.random(in: 15...60)
            let source = Tool.RandomArray(0, 100, count)
            let result = HeapSort.Sort1(source, <)
            if !Tool.IsAscend(result) {
                print("Heap sort source = \n", source)
                print("Heap sort result = \n", result)
                assert(false, "Heap sort valid")
            }
        }
        print("Heap sort test success \(max) times.")
    }
    
    static func Test1() {
        var array = [5, 8, 4, 6, 1, 3]
        print(array)
        let result = Sort2(array: &array, <)
        print("111", result)
        
        let minHeap = Heap(array: array, sort: <)
        print("222", minHeap.nodes)
    }
}
