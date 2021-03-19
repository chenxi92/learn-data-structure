import Foundation
/**
 
 # Given an integer n, return all the structurally unique BST's (binary search
 # trees), which has exactly n nodes of unique values from 1 to n.
 # Return the answer in any order.

 # Constraints:
 # 1 <= n <= 8
 */


/**
 * Definition for a binary tree node.
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

extension TreeNode: CustomStringConvertible {
    public var description: String {
        if self.left != nil && self.right != nil {
            return "\(self.left!.description)<-\(self.val)->\(self.right!.description)"
        }
        if self.left != nil {
            return "\(self.left!.description)<-\(self.val)"
        }
        if self.right != nil {
            return "\(self.val)->\(self.right!.description)"
        }
        return "\(self.val)"
    }
}

class Solution {
    func generateTrees(_ n: Int) -> [TreeNode?] {
        return self.genTrees(1, n)
    }
    
    func genTrees(_ start: Int, _ end: Int) -> [TreeNode?] {
        var ans: [TreeNode?] = []
        if start > end {
            ans.append(nil)
            return ans
        }
        if start == end {
            ans.append(TreeNode(start))
            return ans
        }
        var leftSubTrees: [TreeNode?] = []
        var rightSubTrees: [TreeNode?] = []
        for i in start...end {
            leftSubTrees = genTrees(start, i - 1)
            rightSubTrees = genTrees(i + 1, end)
            for lNode in leftSubTrees {
                for rNode in rightSubTrees {
                    let root = TreeNode(i, lNode, rNode)
                    ans.append(root)
                }
            }
        }
        return ans
    }
}

for tree in Solution().generateTrees(3) {
    print(tree!)
}
