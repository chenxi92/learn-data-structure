/**
 https://leetcode.com/problems/sum-root-to-leaf-numbers/
 
 You are given the root of a binary tree containing digits from 0 to 9 only.

 Each root-to-leaf path in the tree represents a number.

 For example, the root-to-leaf path 1 -> 2 -> 3 represents the number 123.
 Return the total sum of all root-to-leaf numbers. Test cases are generated so that the answer will fit in a 32-bit integer.

 A leaf node is a node with no children.
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
    func sumNumbers(_ root: TreeNode?) -> Int {
        return sum(root, 0)
    }
    
    private func sum(_ node: TreeNode?, _ currentSum: Int) -> Int {
        guard let node = node else {
            return 0
        }
        
        let newCurrentSum = currentSum * 10 + node.val
        
        if node.right == nil && node.left == nil {
            return newCurrentSum
        }
        let leftSubTreeSum = sum(node.left, newCurrentSum)
        let rightSubTreeSum = sum(node.right, newCurrentSum)
        return leftSubTreeSum + rightSubTreeSum
    }
    
    func sumNumbers1(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }

        var queue: [(TreeNode, Int)] = []
        queue.append((root, 0))
        var sum = 0
        
        while queue.isEmpty == false {
            let (node, cur) = queue.removeFirst()
            let newCur = cur * 10 + node.val
            if node.left == nil && node.right == nil {
                sum += newCur
            }
            if let left = node.left {
                queue.append((left, newCur))
            }
            if let right = node.right {
                queue.append((right, newCur))
            }
        }
        return sum
    }
}

let root1 = TreeNode(1, TreeNode(2), TreeNode(3))
let root2 = TreeNode(4, TreeNode(9, TreeNode(5), TreeNode(1)), TreeNode(0))

assert(Solution().sumNumbers(root1) == 25)
assert(Solution().sumNumbers(root2) == 1026)
print("Recursive DFS passed test")

assert(Solution().sumNumbers1(root1) == 25)
assert(Solution().sumNumbers1(root2) == 1026)
print("Iterative DFS passed test")
