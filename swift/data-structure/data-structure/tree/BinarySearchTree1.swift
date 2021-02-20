//
//  BinarySearchTree1.swift
//  data-structure
//
//  Created by chenxi on 2020/7/9.
//  Copyright © 2020 chenxi. All rights reserved.
//

import Foundation

// https://github.com/raywenderlich/swift-algorithm-club/tree/master/Binary%20Search%20Tree


/**
    A binary search tree.
 
    Each node stores a value and tow children. The left child contains a smaller value; the right a larger (or equal) value.
 
    This tree allows dupliicate elements.
 
    This tree does not automatically balance itself. To make sure it is balanced, you should insert new values in randomized order, not in sorter order.
 */
public class BinarySearchTree1<T: Comparable> {
    private(set) public var value:T
    private(set) public var parent: BinarySearchTree1?
    private(set) public var left: BinarySearchTree1?
    private(set) public var right: BinarySearchTree1?
    
    public convenience init(array: [T]) {
        precondition(array.count > 0)
        self.init(value: array.first!)
        for v in array.dropFirst() {
            insert(value: v)
        }
    }
    
    public init(value: T) {
        self.value = value
    }
    
    public var isRoot: Bool {
        return parent == nil
    }
    
    public var isLeaf: Bool {
        return left == nil && right == nil
    }
    
    public var isLeftChild: Bool {
        return parent?.left === self
    }
    
    public var isRightChild: Bool {
        return parent?.right === self
    }
    
    public var hasLeftChild: Bool {
        return left != nil
    }
    
    public var hasRightChild: Bool {
        return right != nil
    }
    
    public var hasAnyChild: Bool {
        return hasLeftChild || hasRightChild
    }
    
    public var hasBothChild: Bool {
        return hasLeftChild && hasRightChild
    }
    
    public var count: Int {
        return (left?.count ?? 0) + 1 + (right?.count ?? 0)
    }
    
    public func insert(value: T) {
        if value < self.value {
            if let left = left {
                left.insert(value: value)
            } else {
                left = BinarySearchTree1(value: value)
                left?.parent = self
            }
        } else {
            if let right = right {
                right.insert(value: value)
            } else {
                right = BinarySearchTree1(value: value)
                right?.parent = self
            }
        }
    }
    
    public func search(_ value: T) -> BinarySearchTree1? {
        if value < self.value {
            return left?.search(value)
        } else if (value > self.value) {
            return right?.search(value)
        } else {
            return self
        }
    }
    
    public func searchUseLoop(_ value: T) -> BinarySearchTree1? {
        var node: BinarySearchTree1? = self
        while let n = node {
            if value < n.value {
                node = n.left
            } else if (value > n.value) {
                node = n.right
            } else {
                return node
            }
        }
        return nil
    }
    
    public func traverseInOrder(process: (T) -> Void) {
        left?.traverseInOrder(process: process)
        process(value)
        right?.traverseInOrder(process: process)
    }
    
    public func traversePreOrder(process: (T) -> Void) {
        process(value)
        left?.traversePreOrder(process: process)
        right?.traversePreOrder(process: process)
    }
    
    public func traversePostOrder(process: (T) -> Void) {
        left?.traversePreOrder(process: process)
        right?.traversePreOrder(process: process)
        process(value)
    }
    
    private func reconnectParentTo(node: BinarySearchTree1?) {
        if let parent = parent {
            if isLeftChild {
                parent.left = node
            } else {
                parent.right = node
            }
        }
        node?.parent = parent
    }
    
    public func minimum() -> BinarySearchTree1 {
        var node = self
        while let next = node.left {
            node = next
        }
        return node
    }
    
    public func maximum() -> BinarySearchTree1 {
        var node = self
        while let next = node.right {
            node = next
        }
        return node
    }
    
    @discardableResult public func remove() -> BinarySearchTree1? {
        let replacement: BinarySearchTree1?
        
        // Replacement for current node can be either biggest one on the left or
        // samllest one on the right, whichever is not nil
        if let right = right {
            replacement = right.minimum()
        } else if let left = left {
            replacement = left.maximum()
        } else {
            replacement = nil
        }
        
        // place the replacement on the current node's position
        replacement?.right = right
        replacement?.left = left
        right?.parent = replacement
        left?.parent = replacement
        reconnectParentTo(node: replacement)
        
        // The current node is no longer of the tree, so clean it up.
        parent = nil
        left = nil
        right = nil
        
        return replacement
    }
    
    public func height() -> Int {
        if isLeaf {
            return 0
        } else {
            return 1 + max(left?.height() ?? 0, right?.height() ?? 0)
        }
    }
    
    public func depth() -> Int {
        var node = self
        var edges = 0
        while let parent = node.parent {
            node = parent
            edges += 1
        }
        return edges
    }
    
    public func predecessor() -> BinarySearchTree1<T>? {
        if let left = left {
            return left.maximum()
        } else {
            var node = self
            while let parent = node.parent {
                if parent.value < value {
                    return parent
                }
                node = parent
            }
            return nil
        }
    }
    
    public func successor() -> BinarySearchTree1<T>? {
        if let right = right {
            return right.minimum()
        } else {
            var node = self
            while let parent = node.parent {
                if parent.value > value {
                    return parent
                }
                node = parent
            }
            return nil
        }
    }
}

extension BinarySearchTree1: CustomStringConvertible {
    public var description: String {
        var s = ""
        if let left = left {
            s += "(\(left.description)) <-"
        }
        s += "\(value)"
        if let right = right {
            s += "-> (\(right.description))"
        }
        return s
    }
}

func BinarySearchTree1Test() {
    example(of: "test binary search tree1") {
        let tree = BinarySearchTree1<Int>(array: [7, 2, 5, 10 , 9 ,1])
        print(tree)
        print("tree count: \(tree.count)")
        
        print("search 2 using if \(tree.search(2)!)")
        print("search 2 using loop \(tree.searchUseLoop(2)!)")

        print("search 21 using if \(String(describing: tree.search(21)))")
        print("search 21 using loop \(String(describing: tree.search(21)))")
        
        print("traverse pre-order")
        tree.traversePreOrder { print($0) }
    }
}
