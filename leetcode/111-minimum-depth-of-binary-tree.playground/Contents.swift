/**
 https://leetcode.com/problems/minimum-depth-of-binary-tree/
 
 Given a binary tree, find its minimum depth.

 The minimum depth is the number of nodes along the shortest path from the root node down to the nearest leaf node.

 Note: A leaf is a node with no children.
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
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        let left = minDepth(root.left)
        let right = minDepth(root.right)
        
        if left == 0 || right == 0 {
            return max(left, right) + 1
        } else {
            return min(left, right) + 1
        }
    }
    
    /// BFS level order traversal
    func minDepth1(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        var queue: [TreeNode] = []
        queue.append(root)
        
        var level = 1
        while !queue.isEmpty {
            let size = queue.count
            for _ in 0..<size {
                let node = queue.removeFirst()
                if node.left == nil && node.right == nil {
                    return level
                }
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
            level += 1
        }
        return level
    }
}

let root1 = TreeNode(3, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7)))
let root2 = TreeNode(2, nil, TreeNode(3, nil, TreeNode(4, nil, TreeNode(5, nil, TreeNode(6)))))

assert(Solution().minDepth(root1) == 2, "except 2, but return \(Solution().minDepth(root1))")
assert(Solution().minDepth(root2) == 5, "except 5, but return \(Solution().minDepth(root2))")
print("passed test DFS")

assert(Solution().minDepth1(root1) == 2, "except 2, but return \(Solution().minDepth1(root1))")
assert(Solution().minDepth1(root2) == 5, "except 5, but return \(Solution().minDepth1(root2))")
print("passed test BFS")
