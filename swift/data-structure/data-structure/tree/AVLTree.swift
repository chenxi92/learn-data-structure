//
//  AVLTree.swift
//  data-structure
//
//  Created by peak on 2021/2/19.
//  Copyright © 2021 chenxi. All rights reserved.
//

import Foundation

/// https://www.raywenderlich.com/books/data-structures-algorithms-in-swift/v3.0/chapters/16-avl-trees#toc-chapter-019-anchor-002

public class AVLTree<Element: Comparable> {
    
    public private(set) var root: AVLNode<Element>?
    
    /**  左旋示意图
        25作为待旋转节点
         50                        50
        /  \                      /  \
       25   65     ====>         37  65
         \                      /  \
         37                    25  40
          \
          40
     */
    private func leftRotate(_ node: AVLNode<Element>) -> AVLNode<Element> {
        /// 选择待旋转节点的右节点作为中枢点
        /// 该中枢点将代替待旋转的节点作为整个子树的根节点
        let pivot = node.rightChild!
        
        /// pivot节点的左节点（如果存在）的值比node节点的值大，作为node节点的右节点
        node.rightChild = pivot.leftChild
        
        /// node节点作为pivot节点的左节点
        pivot.leftChild = node
        
        /// 更新 pivot 和 node 节点的高度
        node.height = max(node.leftHeight, node.rightHeight) + 1
        pivot.height = max(pivot.leftHeight, pivot.rightHeight) + 1
        
        /// 返回 pivot 节点
        return pivot
    }
    
    /** 右旋示意图
            10                  7
           /  \               /   \
          7   12    ===>     4     10
         / \                / \    / \
        4   8              1   5  8  12
       / \
      1   5
     */
    private func rightRotate(_ node: AVLNode<Element>) -> AVLNode<Element> {
        let pivot = node.leftChild!
        node.leftChild = pivot.rightChild
        pivot.rightChild = node
        node.height = max(node.leftHeight, node.rightHeight) + 1
        pivot.height = max(pivot.leftHeight, pivot.rightHeight) + 1
        return pivot
    }
    
    /** right-left 示意图
        
               50                      50                    50
              /  \                    /  \                  /  \
             25  55    =====>        25  55     =====>     36  55
               \                      \                   /  \
               37                     36                 25   37
              /                        \
             36                         37
                                      37右旋               25左旋
     */
    private func rightLeftRotate(_ node: AVLNode<Element>) -> AVLNode<Element> {
        guard let rightChild = node.rightChild else {
            return node
        }
        node.rightChild = rightRotate(rightChild)
        return leftRotate(node)
    }
    
    /** left-right 示意图
     
              50                      50                    50
             /  \                    /  \                  /  \
            25  55    =====>        25  55    =====>      15  55
           /                        /                    /  \
          10                       15                   10   25
           \                      /
           15                    10
                                 10节点左旋              25节点右旋
     */
    private func leftRightRotate(_ node: AVLNode<Element>) -> AVLNode<Element> {
        guard let leftChild = node.leftChild else {
            return node
        }
        node.leftChild = leftRotate(leftChild)
        return rightRotate(node)
    }
    
    private func balanced(_ node: AVLNode<Element>) -> AVLNode<Element> {
        switch node.balanceFactor {
            case 2:
                if let leftChild = node.leftChild, leftChild.balanceFactor == -1 {
                    return leftRightRotate(node)
                } else {
                    return rightRotate(node)
                }
            case -2:
                if let rightChild = node.rightChild, rightChild.balanceFactor == 1 {
                    return rightLeftRotate(node)
                } else {
                    return leftRotate(node)
                }
            default:
                return node
        }
    }
}

// MARK: - Insert

extension AVLTree {
    
    public func insrt(_ value: Element) {
        root = insert(from: root, value: value)
    }
    
    private func insert(from node: AVLNode<Element>?, value: Element) -> AVLNode<Element> {
        guard let node = node else {
            return AVLNode(value: value)
        }
        if value < node.value {
            node.leftChild = insert(from: node.leftChild, value: value)
        } else {
            node.rightChild = insert(from: node.rightChild, value: value)
        }
        let balancedNode = balanced(node)
        balancedNode.height = max(balancedNode.leftHeight, balancedNode.rightHeight) + 1
        return balancedNode
    }
    
}

// MARK: - Remove

extension AVLTree {
    public func remove(_ value: Element) {
        root = remove(from: root, value: value)
    }
    
    private func remove(from node: AVLNode<Element>?, value: Element) -> AVLNode<Element>? {
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
            node.rightChild = remove(from: node.rightChild, value: node.value)
        } else if value < node.value {
            node.leftChild = remove(from: node.leftChild, value: value)
        } else {
            node.rightChild = remove(from: node.rightChild, value: value)
        }
        
        let balancedNode = balanced(node)
        balancedNode.height = max(balancedNode.leftHeight, balancedNode.rightHeight) + 1
        return balancedNode
    }
}

// MARK: - Contain

extension AVLTree {
    public func contain(_ value: Element) -> Bool {
        var current = root
        while let node = current {
            if value == node.value {
                return true
            } else if value < node.value {
                current = node.leftChild
            } else {
                current = node.rightChild
            }
        }
        return false
    }
}

// MARK: - Debug

extension AVLTree: CustomStringConvertible {
    public var description: String {
        return root?.description ?? "empty tree"
    }
}

// MARK: - Test

func AVLTreeTest() {
    example(of: "repeated insertions in sequence") {
        let tree = AVLTree<Int>()
        for i in 0..<15 {
            tree.insrt(i)
        }
        print(tree)
    }
    
    example(of: "left rotation") {
        let tree = AVLTree<Int>()
        tree.insrt(50)
        tree.insrt(65)
        tree.insrt(25)
        tree.insrt(37)
        tree.insrt(40)
        
        print(tree)
    }
    
    example(of: "right rotation") {
        let tree = AVLTree<Int>()
        tree.insrt(1)
        tree.insrt(4)
        tree.insrt(5)
        tree.insrt(7)
        tree.insrt(8)
        tree.insrt(10)
        tree.insrt(12)
        print(tree)
    }
    
    example(of: "right-left rotation") {
        let tree = AVLTree<Int>()
        tree.insrt(50)
        tree.insrt(25)
        tree.insrt(55)
        tree.insrt(37)
        tree.insrt(36)
        print(tree)
    }
    
    example(of: "removing a value") {
        let tree = AVLTree<Int>()
        tree.insrt(15)
        tree.insrt(10)
        tree.insrt(16)
        tree.insrt(18)
        print(tree)
        print("\nremoveing 10\n")
        tree.remove(10)
        print(tree)
    }
    
    example(of: "tree search") {
        let tree = AVLTree<Int>()
        tree.insrt(15)
        tree.insrt(10)
        tree.insrt(16)
        tree.insrt(18)
        print(tree.contain(10))
        print(tree.contain(22))
    }
}
