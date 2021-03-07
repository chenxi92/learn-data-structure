import Foundation

/**
 # https://leetcode.com/problems/remove-linked-list-elements/
 # Remove all elements from a linked list of integers that have value val.
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
            return "\(self.val)->\(self.next!.description)"
        } else {
            return "\(self.val)"
        }
    }
}

class Solution {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        let sentinel = ListNode(0)
        sentinel.next = head
        var pre = sentinel
        var cur = head
        while cur != nil {
            if cur?.val == val {
                pre.next = cur?.next
            } else {
                pre = cur!
            }
            cur = cur?.next
        }
        return sentinel.next
    }
}

var head = ListNode(1, ListNode(2, ListNode(6, ListNode(3, ListNode(4, ListNode(5, ListNode(6)))))))
print(head)
print(Solution().removeElements(head, 6)!)
