/**
 https://leetcode.com/problems/binary-tree-zigzag-level-order-traversal/
 */
import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() {
        self.val = 0
        self.left = nil
        self.right = nil
    }
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        var results: [[Int]] = []
        if root == nil {
            return results
        }
        
        var queue: [TreeNode?] = []
        queue.append(root)
        
        while queue.isEmpty == false {
            var singleOrder: [Int] = []
            var count = queue.count - 1
            
            while count >= 0 {
                if let node = queue.removeFirst() {
                    if results.count % 2 == 0 {
                        singleOrder.append(node.val)
                    } else {
                        singleOrder.insert(node.val, at: 0)
                    }
                    
                    count -= 1
                    
                    if let left = node.left {
                        queue.append(left)
                    }
                    if let right = node.right {
                        queue.append(right)
                    }
                }
            }
            results.append(singleOrder)
            
        }
        return results
    }
}

