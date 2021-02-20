//
//  AVLNode.swift
//  data-structure
//
//  Created by peak on 2021/2/19.
//  Copyright © 2021 chenxi. All rights reserved.
//

import Foundation

public class AVLNode<Element> {
    
    public var value: Element
    public var leftChild: AVLNode?
    public var rightChild: AVLNode?
    public var height = 0
    
    public init(value: Element) {
        self.value = value
    }
    
    public var balanceFactor: Int {
        return leftHeight - rightHeight
    }
    
    public var leftHeight: Int {
        return leftChild?.height ?? -1
    }
    
    public var rightHeight: Int {
        return rightChild?.height ?? -1
    }
}

extension AVLNode {
    var min: AVLNode {
        return leftChild?.min ?? self
    }
}

extension AVLNode: CustomStringConvertible {
    public var description: String {
        return diagram(for: self)
    }
    
    private func diagram(for node: AVLNode?,
                         _ top: String = "",
                         _ root: String = "",
                         _ bottom: String = "") -> String {
        guard let node = node else {
            return root + "nil\n"
        }
        if node.leftChild == nil && node.rightChild == nil {
            return root + "\(node.value)\n"
        }
        return diagram(for: node.rightChild, top + " ", top + "┌──", top + "│ ")
                    + root + "\(node.value)\n"
                    + diagram(for: node.leftChild, bottom + "│ ", bottom + "└──", bottom + " ")
    }
}

extension AVLNode {
    /// 有序遍历
    ///
    /// In-order traversal visit the nodes of a binary tree in the following order, starting from the root node
    /// - If the current node has a left child, recursively visit this child first
    /// - Then visit the node itself
    /// - If the current node has a right child, recursively visit this child
    public func traverseInOrder(visit: (Element) -> Void) {
        leftChild?.traverseInOrder(visit: visit)
        visit(value)
        rightChild?.traverseInOrder(visit: visit)
    }
    
    /// 前置遍历
    ///
    /// Pre-order traversal always visits the current node first, then recursively visit the left and right child
    public func traversePreOrder(visit: (Element) -> Void) {
        visit(value)
        leftChild?.traversePreOrder(visit: visit)
        rightChild?.traversePreOrder(visit: visit)
    }
    
    /// 后置遍历
    ///
    /// Post-order traversal only visits the current node after the left and right child have been visited recursively.
    public func traversePostOrder(visit: (Element) -> Void) {
        leftChild?.traversePostOrder(visit: visit)
        rightChild?.traversePostOrder(visit: visit)
        visit(value)
    }
}

