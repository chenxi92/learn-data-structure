/**
 https://leetcode.com/problems/balanced-binary-tree/
 
 Given a binary tree, determine if it is height-balanced.

 For this problem, a height-balanced binary tree is defined as:
 > a binary tree in which the left and right subtrees of every node differ in height by no more than 1.

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
    func isBalanced(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        let left = depth(root.left)
        let right = depth(root.right)
        
        return abs(left - right) <= 1 && isBalanced(root.left) && isBalanced(root.right)
    }
    
    private func depth(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        return max(depth(root.left), depth(root.right)) + 1
    }
    
    func isBalanced1(_ root: TreeNode?) -> Bool {
        return dfsHeight(root) != Int.min
    }
    
    private func dfsHeight(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        let leftHeight = dfsHeight(root.left)
        if leftHeight == Int.min {
            return Int.min
        }
        let rightHeight = dfsHeight(root.right)
        if rightHeight == Int.min {
            return Int.min
        }
        
        if abs(leftHeight - rightHeight) > 1 {
            return Int.min
        }
        
        return max(leftHeight, rightHeight) + 1
    }
}

let root1 = TreeNode(3, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7)))
let root2 = TreeNode(1, TreeNode(2, TreeNode(3, TreeNode(4), TreeNode(4)), TreeNode(3)), TreeNode(2))
assert(Solution().isBalanced(root1))
assert(Solution().isBalanced(root2) == false)

print("-- passed test 1")

assert(Solution().isBalanced1(root1))
assert(Solution().isBalanced1(root2) == false)

print("-- passed test 2")
