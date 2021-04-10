import UIKit

/**
 # https://leetcode.com/problems/path-sum-ii/
 # Given the root of a binary tree and an integer targetSum,
 # return all root-to-leaf paths where each path's sum equals targetSum.
 # A leaf is a node with no children.
 
 # Constraints:
 # The number of nodes in the tree is in the range [0, 5000].
 # -1000 <= Node.val <= 1000
 # -1000 <= targetSum <= 1000

 # Definition for a binary tree node.
 */

/**
 * Definition for a binary tree node.
 *
 */
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
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
        var ans: [[Int]] = []
        var path: [Int] = []
        track(root,&path, targetSum, &ans)
        return ans
    }
    
    private func track(_ root: TreeNode?, _ path: inout [Int], _ target: Int, _ result: inout [[Int]]) {
        if root === nil {
            return
        }
        var newPath = Array(path)
        newPath.append(root!.val)
        if root?.left === nil && root?.right === nil && root?.val == target {
            result.append(Array(newPath))
            return
        }
        
        track(root?.left, &newPath, target - root!.val, &result)
        track(root?.right, &newPath, target - root!.val, &result)
    }
}

let root = TreeNode(0, TreeNode(1), TreeNode(1))
print(Solution().pathSum(root, 1))
