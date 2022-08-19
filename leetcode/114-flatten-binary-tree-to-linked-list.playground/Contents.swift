/**
 https://leetcode.com/problems/flatten-binary-tree-to-linked-list/
 
 Given the root of a binary tree, flatten the tree into a "linked list":

 The "linked list" should use the same TreeNode class where the right child pointer points to the next node in the list and the left child pointer is always null.
 The "linked list" should be in the same order as a pre-order traversal of the binary tree.
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
    private var pre: TreeNode? = nil
    
    func flatten(_ root: TreeNode?) {
        guard let root = root else { return }
        
        // use postorder to traversal
        // right -> left -> root
        flatten(root.right)
        flatten(root.left)
        
        root.right = pre
        root.left = nil
        pre = root
    }
    
    func flatten1(_ root: TreeNode?) {
        var now: TreeNode? = root
        while now != nil {
            if now?.left != nil {
                var pre = now?.left
                while pre?.right != nil {
                    pre = pre?.right
                }
                pre?.right = now?.right
                now?.right = now?.left
                now?.left = nil
            }
            now = now?.right
        }
    }
}

func debug(_ root: TreeNode) {
    var msg: String = ""
    var current: TreeNode? = root
    while current != nil {
        msg += "\(current!.val)"
        current = current?.right
        if current != nil {
            msg += " -> "
        }
    }
    print(msg)
}

let root1 = TreeNode(1, TreeNode(2, TreeNode(3), TreeNode(4)), TreeNode(5, nil, TreeNode(6)))
let root2 = root1
Solution().flatten(root1)
debug(root1)

Solution().flatten1(root2)
debug(root2)
