
**堆排序（英语：Heapsort）** 是指利用堆这种数据结构所设计的一种排序算法。堆是一个近似完全二叉树的结构，并同时满足堆积的性质：即子节点的键值或索引总是小于（或者大于）它的父节点。

### 算法简介

1. 根据数组创建堆；
2. 把堆首（最大值）和堆尾互换；
3. 把堆的尺寸缩小 1，并从根节点把剩余元素继续维持成堆；
4. 重复步骤 2，直到堆的尺寸为 0。



### 动图演示

![堆排序](./images/heapSort-1.gif)



![堆排序](./images/heapSort-2.gif)


### 代码实现

#### swift

`swift` 版本 `5.1`

```swift
static func Sort<T: Comparable>( array: inout [T], _ orderCriteria:(T, T) -> Bool) -> [T] 
{
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
```



### 性能

平均时间复杂度: O (n log n)

空间复杂度: O (n)



### 参考

[heap sort with swift](http://blog.hacktons.cn/2016/03/23/heap-sort-with-swift/)

[维基百科](https://zh.wikipedia.org/wiki/堆排序)

[堆排序](https://www.runoob.com/w3cnote/heap-sort.html)