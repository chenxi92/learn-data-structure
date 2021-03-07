import Foundation

/**
 # https://leetcode.com/problems/remove-duplicates-from-sorted-list-ii/

 # Given the head of a sorted linked list, delete all nodes that have duplicate
 # numbers, leaving only distinct numbers from the original list.
 # Return the linked list sorted as well.

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
        let sentinel = ListNode(0)
        sentinel.next = head
        var pre = sentinel
        var cur = head
        while cur != nil {
            var diffNums = 0
            var diffNode = cur
            while diffNode != nil && cur?.val == diffNode?.val {
                diffNums += 1
                diffNode = diffNode?.next
            }
            if diffNums > 1 {
                pre.next = diffNode
            } else {
                pre = cur!
            }
            cur = diffNode
        }
        return sentinel.next
    }
}

let head = ListNode(1, ListNode(2, ListNode(2, ListNode(2, ListNode(3)))))
print(head)
print(Solution().deleteDuplicates(head)!)
