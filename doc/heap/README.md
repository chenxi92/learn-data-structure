### 堆

堆(heap)又被称为优先队列(priority queue)。 尽管被称为优先队列，但堆并不是队列。 队列是**先入先出**的方式取出元素， 而堆中是按照元素的**优先级**取出元素。



#### 堆的实现

堆的经典实现是**完全二叉树(complete binary tree)**，这样实现的堆称为**二叉堆(binary heap)**。



完全二叉树的限定条件是：假设一个树的深度为n，则n-1层必须被填满，且第n层也必须从左到右的顺序被填满。

为了实现堆的操作， 我们增加了一个额外要求：任意节点的优先级不小于它的子节点。



##### 插入操作

1. 新插入的节点放在完全二叉树最后的位置；
2. 新插入的节点和父节点比较，如果比父节点小，交换二者的位置；
3. 继续进行第2步，直到新节点不比父节点小或新节点成为根节点；

##### 删除操作

1. 将最后一个last节点 和 跟节点 互换位置；
2. 删除最后一个last节点；
3. 新的跟节点和子节点比较，如果新的跟节点比子节点大，互换位置；
4. 重复第3步，直到新的跟节点不大于任意子节点或者新的根节点成为叶节点；



#### 代码实现

##### Swift

```swift
import Foundation

public struct Heap<T> {
    
    var nodes = [T]()
    
    /// Determines how to compare two nodes in the heap.
    ///
    /// Use `>` for a max-heap or `<` for a min-heap,
    /// or provide a comparing method if the heap is made
    ///  of custom elements, for example tuples.
    private var orderCriteria:(T, T) -> Bool
    
    public init(sort: @escaping(T, T) -> Bool) {
        self.orderCriteria = sort
    }
    
    /// Create a heap from an array.
    ///
    /// The order of the array does not matter;
    /// the elements are inserted into the heap in the order determined by the sort function.
    /// For comparable data types, '>' makes a max-heap, '<' makes a min-hap.
    public init(array: [T], sort: @escaping(T, T) -> Bool) {
        self.orderCriteria = sort
        configureHeap(from: array)
    }
    
    /// Configures the max-heap or min-heap from an array, in a bottom-up manner.
    ///
    /// - Parameter array: sort array
    ///
    /// Performance: This runs pretty much in O(n).
    private mutating func configureHeap(from array: [T]) {
        nodes = array
        for i in stride(from: (nodes.count/2 - 1), through: 0, by: -1) {
            shiftDown(i)
        }
    }
    
    public var isEmpty: Bool {
        return nodes.isEmpty
    }
    
    public var count: Int {
        return nodes.count
    }
    
    @inline(__always) internal func parentIndex(ofIndex i: Int) -> Int {
        return (i - 1)/2
    }
    
    @inline(__always) internal func leftChildIndex(ofIndex i: Int) -> Int {
        return 2 * i + 1
    }
    
    @inline(__always) internal func rightChildIndex(ofIndex i: Int) -> Int {
        return 2 * i + 2
    }
    
    public func peak() -> T? {
        return nodes.first
    }
    
    /// Add a new value to the heap.
    /// - Parameter value: new value.
    ///
    /// This reorders the heap so that the max-heap or min-heap property still holds.
    /// Performance: O(log n).
    public mutating func insert(_ value: T) {
        nodes.append(value)
        shiftUp(nodes.count - 1)
    }
    
    public mutating func insert<S: Sequence>(_ sequence: S) where S.Iterator.Element == T {
        for value in sequence {
            insert(value)
        }
    }
    
    public mutating func replace(index i: Int, value: T) {
        guard i < nodes.count else {
            return
        }
        
        remove(at: i)
        insert(value)
    }


​    
    /// Remove the root ndoe from the heap.
    ///
    /// For a max-heap, this is the maximum value;
    /// for a min-heap, this is the minimum value;
    /// Performance: O(log n)
    @discardableResult public mutating func remove() -> T? {
        guard !nodes.isEmpty else { return nil }
        
        if nodes.count == 1 {
            return nodes.removeLast()
        } else {
            let value = nodes[0]
            nodes[0] = nodes.removeLast()
            shiftDown(0)
            return value
        }
    }
    
    @discardableResult public mutating func remove(at index: Int) -> T? {
        guard index < nodes.count else { return nil }
        
        let size = nodes.count - 1
        if index != size {
            nodes.swapAt(index, size)
            shiftDown(from: index, until: size)
            shiftUp(index)
        }
        return nodes.removeLast()
    }
 
    /// Takes a child node and looks at its parents;
    /// if a parent is not larger (max-heap) or not smaller (min-heap) than the child, exchange them.
    internal mutating func shiftUp(_ index: Int) {
        var childIndex = index
        var parentIndex = self.parentIndex(ofIndex: childIndex)
        
        while childIndex > 0 && orderCriteria(nodes[childIndex], nodes[parentIndex]) {
            nodes.swapAt(childIndex, parentIndex)
            childIndex = parentIndex
            parentIndex = self.parentIndex(ofIndex: childIndex)
        }
    }
    
    /// Looks at a parent node and makes sure it is still larger (max-heap)
    /// or smaller (min-heap) than its children.
    internal mutating func shiftDown(from parentIndex: Int, until endIndex: Int) {
        let leftChildIndex = self.leftChildIndex(ofIndex: parentIndex)
        let rightChildIndex = leftChildIndex + 1
        
        var first = parentIndex
        if leftChildIndex < endIndex && orderCriteria(nodes[leftChildIndex], nodes[first]) {
            first = leftChildIndex
        }
        if rightChildIndex < endIndex && orderCriteria(nodes[rightChildIndex], nodes[first]) {
            first = rightChildIndex
        }
        if first == parentIndex {
            return
        }
        
        nodes.swapAt(parentIndex, first)
        shiftDown(from: first, until: nodes.count)
    }
    
    internal mutating func shiftDown(_ index: Int) {
        shiftDown(from: index, until: nodes.count)
    }
}

// MARK: - Searching

extension Heap where T: Equatable {
    /// Get the index of a node in the heap.
    /// Performance: O(n).
    public func index(of node: T) -> Int? {
        return nodes.firstIndex(where: { $0 == node })
    }
    
    /// Remove the first occurrence of a node from the heap.
    /// Performance: O(n).
    @discardableResult public mutating func remove(node: T) -> T? {
        if let index = index(of: node) {
            return remove(at: index)
        }
        return nil
    }
}
```



#### 参考

[纸上谈兵: 堆 (heap)](https://www.cnblogs.com/vamei/archive/2013/03/20/2966612.html)