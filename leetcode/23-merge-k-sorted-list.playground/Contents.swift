import UIKit

/**
 * Definition for singly-linked list.
 */
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

extension ListNode: CustomStringConvertible {
    public var description: String {
        if self.next != nil {
            return "\(self.val)->\(self.next!.description)"
        }
        return "\(self.val)"
    }
}

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

struct PriorityQueue<Element> {
    private var heap: Heap<Element>
    
    init(sort: @escaping (Element, Element) -> Bool, elements: [Element] = []) {
        heap = Heap(array: elements, sort: sort)
    }
    
    mutating func enqueue(_ element: Element) -> Bool {
        heap.insert(element)
        return true
    }
    
    mutating func dequeue() -> Element? {
        return heap.remove()
    }
    
    var isEmpty: Bool {
        return heap.isEmpty
    }
    
    var peek: Element? {
        return heap.peak()
    }
}

class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var ans: ListNode?
        for node in lists {
            ans = self.mergeTwoList(ans, node)
        }
        return ans
    }
    
    func mergeTwoList(_ l1:ListNode?, _ l2:ListNode?) ->ListNode? {
        if(l1 == nil) {
            return l2
        }
        if(l2 == nil) {
            return l1
        }
        var result:ListNode?
        if(l1!.val <= l2!.val) {
            result = l1
            result!.next = mergeTwoList(l1!.next,l2)
        }
        else {
            result = l2
            result!.next = mergeTwoList(l1,l2!.next)
        }
        return result
    }
    
    func mergeKLists2(_ lists: [ListNode?]) -> ListNode? {
        if lists.count < 1 {
            return nil
        }
        var priorityQueue = PriorityQueue(sort: { (l1: ListNode, l2: ListNode) -> Bool in
            l1.val < l2.val
        }, elements: [])
        for node in lists {
            if node != nil {
                priorityQueue.enqueue(node!)
            }
        }
        
        let sentinal = ListNode(0)
        var cur: ListNode? = sentinal
        while !priorityQueue.isEmpty {
            let node = priorityQueue.dequeue()!
            cur?.next = node
            cur = cur?.next
            if node.next != nil {
                priorityQueue.enqueue(node.next!)
            }
        }
        return sentinal.next
    }
}

let l1 = ListNode(1, ListNode(4, ListNode(5)))
let l2 = ListNode(1, ListNode(3, ListNode(4)))
let l3 = ListNode(2, ListNode(6))
let lists = [l1, l2, l3]
print("--- begin merge ---")
for node in lists {
    print(node)
}
print("--- after merge ---")
//print(Solution().mergeTwoList(l1, l2)!)
print("method 1 :", Solution().mergeKLists2([]))
