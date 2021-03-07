import Foundation

/**
 https://leetcode.com/problems/delete-node-in-a-linked-list/
 
 Write a function to delete a node in a singly-linked list.
 You will not be given access to the head of the list,
 instead you will be given access to the node to be deleted directly.

 It is guaranteed that the node to be deleted is not a tail node in the list.

 Constraints:

 # The number of the nodes in the given list is in the range [2, 1000].
 # -1000 <= Node.val <= 1000
 # The value of each node in the list is unique.
 # The node to be deleted is in the list and is not a tail node
 */
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() {
        self.val = 0
        self.next = nil
    }
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
}

extension ListNode: CustomStringConvertible {
    public var description: String {
        if self.next != nil {
            return "\(self.val)->" + self.next!.description
        } else {
            return "\(self.val)"
        }
    }
}

class Solution {
    func deleteNodes(_ node: ListNode?) {
        node!.val = node!.next!.val
        node?.next = node?.next?.next
    }
}
