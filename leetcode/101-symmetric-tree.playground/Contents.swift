/**
 https://leetcode.com/problems/symmetric-tree/
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

extension TreeNode: Equatable {
    public static func ==(lhs: TreeNode, rhs: TreeNode) -> Bool {
        lhs.val == rhs.val && lhs.left == rhs.right && lhs.right == rhs.left
    }
}

class Solution {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return root?.left == root?.right
    }
    
    func IsSymmetric1(_ root: TreeNode?) -> Bool {
        return isMirror(root?.left, root?.right)
    }
    
    func isMirror(_ lhs: TreeNode?, _ rhs: TreeNode?) -> Bool {
        if lhs == nil && rhs == nil {
            return true
        }
        if lhs == nil || rhs == nil {
            return false
        }
        if lhs?.val != rhs?.val {
            return false
        }
        return isMirror(lhs?.left, rhs?.right) && isMirror(lhs?.right, rhs?.left)
    }
}


