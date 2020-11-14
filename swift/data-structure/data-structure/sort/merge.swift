//
//  merge.swift
//  data-structure
//
//  Created by peak on 2020/11/12.
//  Copyright © 2020 chenxi. All rights reserved.
//

import Foundation

class Merge {
    
    static public func SortUpToDown<T: Comparable>(array: inout [T], _ orderCriteria:(T, T) -> Bool) -> [T] {
        guard array.count > 1 else {
            return array
        }
        Sort(array: &array, low: 0, high: array.count - 1, orderCriteria: orderCriteria)
        return array
    }
    
    static private func Sort<T: Comparable>(array: inout [T], low: Int, high: Int, orderCriteria:(T, T) -> Bool) {
        guard high > low else {
            return
        }
        
        let mid = low + (high - low)/2 // 避免溢出
        Sort(array: &array, low: low, high: mid, orderCriteria: orderCriteria)
        Sort(array: &array, low: mid + 1, high: high, orderCriteria: orderCriteria)
        Merge(array: &array, low: low, mid: mid, high: high, orderCriteria: orderCriteria)
    }
    
    /// 原地归并的抽象方法
    static private func Merge<T: Comparable>(array: inout [T], low: Int, mid: Int, high: Int, orderCriteria: (T, T) -> Bool) {
        var left = low
        var right = mid + 1
        var aux = [T]()
        for k in 0 ... high {
            aux.append(array[k])
        }
        for k in low ... high {
            if (left > mid) { // 左半部分元素取完
                array[k] = aux[right]
                right += 1
            } else if (right > high) { // 右半部分元素取完
                array[k] = aux[left]
                left += 1
            } else if orderCriteria(aux[right], aux[left]) {
                array[k] = aux[right]
                right += 1
            } else {
                array[k] = aux[left]
                left += 1
            }
        }
    }
    
    static private func Merge<T: Comparable>(_ leftArray: [T], _ rightArray: [T]) -> [T]
    {
        var sortedArray = [T]()
        var l = 0, r = 0
        while l < leftArray.count && r < rightArray.count {
            if leftArray[l] > rightArray[r] {
                sortedArray.append(leftArray[l])
                l += 1
            } else if leftArray[l] < rightArray[r] {
                sortedArray.append(rightArray[r])
                r += 1
            } else {
                sortedArray.append(leftArray[l])
                l += 1
                sortedArray.append(rightArray[r])
                r += 1
            }
        }
        return sortedArray
    }
    
    static func SortBottomToUp<T>(_ array: [T], _ orderCriteria: (T, T) -> Bool) -> [T] {
        let n = array.count

        /// 1. 双缓存：分配一个临时工作数组，同时避免每次合并的时候重新分配内存；
        /// 使用2个数组，分别用来读写操作；
        /// 变量 d 来控制读写位置
        var z = [array, array]
        var d = 0
        
        /// 2. 待合并的数组宽度 1, 2, 4, 8, ...
        var width = 1
        while width < n {
            var writeArray = z[1 - d]
            let readArray = z[d]
            /// 3. 每次待合并的小数组的起始位置
            var begin = 0
            while begin < n {
                
                /// 当前处理的位置
                var index = begin
                /// 左边数组起始位置
                var left = begin
                /// 右侧数组起始位置
                var right = left + width
                
                let lmax = min(left + width, n)
                let rmax = min(right + width, n)
                
                while left < lmax && right < rmax {
                    if orderCriteria(readArray[left], readArray[right]) {
                        writeArray[index] = readArray[left]
                        left += 1
                    } else {
                        writeArray[index] = readArray[right]
                        right += 1
                    }
                    index += 1
                }
                /// 右侧处理完毕，处理左侧数组
                while left < lmax {
                    writeArray[index] = readArray[left]
                    index += 1
                    left += 1
                }
                /// 左侧数组处理完毕， 处理右侧数组
                while right < rmax {
                    writeArray[index] = readArray[right]
                    index += 1
                    right += 1
                }
                
                /// 相邻数组处理完毕，移动到下一对小数组
                begin += width*2
            }
            /// 增加数组合并范围
            width *= 2
            
            /// 切换辅助数组读写位置
            z[1-d] = writeArray
            d = 1 - d
        }
        return z[d]
    }
    
    static func TestUpToDown() {
        print("\nMerge sort up to down test begin")
        let max = Int.random(in: 25...100)
        for _ in 0 ..< max {
            let count = Int.random(in: 15...60)
            var source = Tool.RandomArray(0, 100, count)
            let result = SortUpToDown(array: &source, <)
            if !Tool.IsAscend(result) {
                print("Merge sort up to down source = \n", source)
                print("Merge sort up to down result = \n", result)
                assert(false, "Heap sort2 valid")
            }
        }
        print("Merge sort up to down test success \(max) times.")
    }
    
    static func TestBottomToUp() {
        print("\nMerge sort bottom to up test begin")
        let max = Int.random(in: 25...100)
        for _ in 0 ..< max {
            let count = Int.random(in: 15...60)
            let source = Tool.RandomArray(0, 100, count)
            let result = SortBottomToUp(source, <)
            if !Tool.IsAscend(result) {
                print("Merge sort up to down source = \n", source)
                print("Merge sort up to down result = \n", result)
                assert(false, "Merge sort up to down valid")
            }
        }
        print("Merge sort bottom to up test success \(max) times.")
    }
}
