import Foundation

import Foundation

/**
 # https://leetcode.com/problems/remove-duplicates-from-sorted-list/
 # Given the head of a sorted linked list, delete all duplicates such that
 # each element appears only once. Return the linked list sorted as well.

 # Constraints:
 # The number of nodes in the list is in the range [0, 300].
 # -100 <= Node.val <= 100
 # The list is guaranteed to be sorted in ascending order.
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
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var cur = head
        while cur != nil && cur!.next != nil {
            if cur!.val == cur!.next!.val {
                cur?.next = cur?.next?.next
            } else {
                cur = cur?.next
            }
        }
        return head
    }
}

let head = ListNode(1, ListNode(1, ListNode(2, ListNode(3, ListNode(3)))))
print(head)
print(Solution().deleteDuplicates(head)!)

