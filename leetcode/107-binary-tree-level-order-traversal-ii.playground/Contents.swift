/**
 https://leetcode.com/problems/binary-tree-level-order-traversal-ii/
 
 Given the root of a binary tree, return the bottom-up level order traversal of its nodes' values. (i.e., from left to right, level by level from leaf to root).

 */
import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        var result:[[Int]] = []
        guard let root = root else { return result }
        
        var stack: [TreeNode] = []
        stack.append(root)
        
        while !stack.isEmpty {
            var singleStack: [TreeNode] = []
            var singleArray: [Int] = []
            
            while !stack.isEmpty {
                let node = stack.removeFirst()
                singleArray.append(node.val)
                
                if let left = node.left {
                    singleStack.append(left)
                }
                if let right = node.right {
                    singleStack.append(right)
                }
            }
            result.insert(singleArray, at: 0)
            
            // append leaf node in the next leve
            stack.append(contentsOf: singleStack)
        }
        return result
    }
}


let root = TreeNode(3)
root.left = TreeNode(9)
root.right = TreeNode(20)
root.right?.left = TreeNode(15)
root.right?.right = TreeNode(7)

Solution().levelOrderBottom(root).forEach { print($0) }
print("\n---")
Solution().levelOrderBottom(TreeNode(1)).forEach { print($0) }
print("\n---")
Solution().levelOrderBottom(nil).forEach { print($0) }
print("\n---")
