//
//  BinarySearchTree2.swift
//  data-structure
//
//  Created by peak on 2021/2/19.
//  Copyright © 2021 chenxi. All rights reserved.
//

import Foundation

public class BinarySearchTree2<Element: Comparable> {
    public private(set) var root: BinaryNode<Element>?
    
    public init() {}
}

extension BinarySearchTree2: CustomStringConvertible {
    public var description: String {
        return root?.description ?? "empty tree"
    }
}

extension BinarySearchTree2 {
    public func insert(_ value: Element) {
        root = insert(from: root, value: value)
    }
    
    private func insert(from node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element>? {
        guard let node = node else {
            return BinaryNode(value: value)
        }
        if value < node.value {
            node.leftChild = insert(from: node.leftChild, value: value)
        } else {
            node.rightChild = insert(from: node.rightChild, value: value)
        }
        return node
    }
}

extension BinarySearchTree2 {
    
    /// O(n)
    public func contains(_ value: Element) -> Bool {
        guard let root = root else {
            return false
        }
        var found = false
        root.traverseInOrder {
            if $0 == value {
                found = true
            }
        }
        return found
    }
    
    /// O(log n)
    public func contains2(_ value: Element) -> Bool {
        var current = root
        while let node = current {
            if node.value == value {
                return true
            }
            if value < node.value {
                current = node.leftChild
            } else {
                current = node.rightChild
            }
        }
        return false
    }
}

private extension BinaryNode {
    var min: BinaryNode {
        return leftChild?.min ?? self
    }
}

extension BinarySearchTree2 {
    public func remove(_ value: Element) {
        root = remove(node: root, value: value)
    }
    
    private func remove(node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element>? {
        guard let node = node else {
            return nil
        }
        
        if value == node.value {
            /// 1. 叶节点，直接删除
            if node.leftChild == nil && node.rightChild == nil {
                return nil
            }
            
            /// 2. 单个子节点
            if node.leftChild == nil {
                return node.rightChild
            }
            if node.rightChild == nil {
                return node.leftChild
            }
            
            /// 3. 当前节点有2个子节点
            /// 找到该节点的右子树中最小的值，把当前节点的值替换为右子树中最小的值
            /// 删除右子树最小值
            node.value = node.rightChild!.min.value
            node.rightChild = remove(node: node.rightChild, value: node.value)
        } else if value < node.value {
            node.leftChild = remove(node: node.leftChild, value: value)
        } else {
            node.rightChild = remove(node: node.rightChild, value: value)
        }
        return node
    }
}

func makeExampleBinarySearchTree2() -> BinarySearchTree2<Int> {
    let bst = BinarySearchTree2<Int>()
    bst.insert(3)
    bst.insert(1)
    bst.insert(4)
    bst.insert(0)
    bst.insert(2)
    bst.insert(5)
    bst.insert(6)
    return bst
}

func BinarySearchTree2Test() {
    example(of: "building a BST") {
        let bst = makeExampleBinarySearchTree2()
        print(bst)
    }
    
    example(of: "finding a node") {
        let bst = makeExampleBinarySearchTree2()
        if bst.contains(5) {
            print("Found 5!")
        } else {
            print("Coundn't find 5")
        }
    }
    
    example(of: "removing a node") {
        let bst = makeExampleBinarySearchTree2()
        print("Tree before removal:")
        print(bst)
        bst.remove(3)
        print("Tree after removing root:")
        print(bst)
    }
}
