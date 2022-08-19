/**
 https://leetcode.com/problems/populating-next-right-pointers-in-each-node/
 
 You are given a perfect binary tree where all leaves are on the same level, and every parent has two children. The binary tree has the following definition:

 struct Node {
   int val;
   Node *left;
   Node *right;
   Node *next;
 }
 Populate each next pointer to point to its next right node. If there is no next right node, the next pointer should be set to NULL.

 Initially, all next pointers are set to NULL.
 */
import Foundation

public class Node {
    public var val: Int
    public var left: Node?
    public var right: Node?
    public var next: Node?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.next = nil
    }
}


class Solution {
    /// BFS - right to left
    func connect(_ root: Node?) -> Node? {
        guard let root = root else {
            return root
        }
        var queue: [Node] = []
        queue.append(root)
        while !queue.isEmpty {
            var nextNode: Node? = nil
            let count = queue.count
            for _ in 0..<count {
                let cur = queue.removeFirst()
                cur.next = nextNode
                nextNode = cur
                
                if let right = cur.right {
                    queue.append(right)
                }
                if let left = cur.left {
                    queue.append(left)
                }
            }
        }
        return root
    }
    
    private func dfs(_ cur: Node?, _ next: Node?) {
        guard let cur = cur else {
            return
        }
        cur.next = next
        dfs(cur.left, cur.right)
        dfs(cur.right, cur.next == nil ? nil : cur.next?.left)
    }
}

let root = Node(1)
let node2 = Node(2)
let node3 = Node(3)
let node4 = Node(4)
let node5 = Node(5)
let node6 = Node(6)
let node7 = Node(7)
root.left = node2
root.right = node3
node2.left = node4
node2.right = node5
node3.left = node6
node3.right = node7

Solution().connect(root)
