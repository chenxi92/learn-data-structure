
**堆排序（英语：Heapsort）** 是指利用堆这种数据结构所设计的一种排序算法。堆是一个近似完全二叉树的结构，并同时满足堆积的性质：即子节点的键值或索引总是小于（或者大于）它的父节点。

### 算法简介

1. 创建一个堆 H[0……n-1]；
2. 把堆首（最大值）和堆尾互换；
3. 把堆的尺寸缩小 1，并调用 heapify(0)，目的是把新的数组顶端数据调整到相应位置；
4. 重复步骤 2，直到堆的尺寸为 1。



### 动图演示

![堆排序](./images/heapSort-1.gif)



![堆排序](./images/heapSort-2.gif)


### 代码实现

#### swift

`swift` 版本 `5.1`

```swift
/// 维护最大/小堆的性质
///
/// - Parameters:
///   - array: 待排序数组
///   - i: 父节点
///   - size: 数组大小
///   - isOrderedBefore: 排序方式
private func heapify<T: Comparable>(_ array: inout [T], _ i: Int, _ size: Int, _ isOrderedBefore: (T , T) -> Bool) {
    let left = 2 * i
    let right = left + 1
    var largest = i
    if left < size && isOrderedBefore(array[largest], array[left]) {
        largest = left
    }
    if right < size && isOrderedBefore(array[largest], array[right]) {
        largest = right
    }
    if largest != i {
        array.swapAt(i, largest)
        heapify(&array, largest, size, isOrderedBefore)
    }
}

/// 构建最大/小堆
private func buildHeap<T: Comparable>(_ array: inout [T], _ isOrderedBefore: (T , T) -> Bool) {
    for i in stride(from: array.count/2, through: 0, by: -1) {
        heapify(&array, i, array.count, isOrderedBefore)
    }
}

/// 堆排序
///
/// - Parameters:
///   - array: 待排序数组
///   - isOrderedBefore: 排序方式
func heapSort<T: Comparable>(_ array: inout [T], _ isOrderedBefore: (T , T) -> Bool) {
    buildHeap(&array, isOrderedBefore)
    var size = array.count
    for index in stride(from: array.count - 1, through: 1, by: -1) {
        array.swapAt(index, 0)
        size -= 1
        heapify(&array, 0, size, isOrderedBefore)
    }
}
```



### 性能

平均时间复杂度: O (n log n)

空间复杂度: O (n)



### 参考

[heap sort with swift](http://blog.hacktons.cn/2016/03/23/heap-sort-with-swift/)

[维基百科](https://zh.wikipedia.org/wiki/堆排序)

[堆排序](https://www.runoob.com/w3cnote/heap-sort.html)