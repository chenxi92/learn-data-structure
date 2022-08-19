/**
 https://leetcode.com/problems/populating-next-right-pointers-in-each-node-ii/
 
 Given a binary tree

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
    func connect(_ root: Node?) -> Node? {
        guard let root = root else {
            return nil
        }
        var queue: [Node] = []
        queue.append(root)
        
        while !queue.isEmpty {
            var next: Node? = nil
            let count = queue.count
            for _ in 0..<count {
                let cur = queue.removeFirst()
                cur.next = next
                next = cur
                
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
}
