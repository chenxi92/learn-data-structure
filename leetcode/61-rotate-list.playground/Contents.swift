import Foundation

/**
 # https://leetcode.com/problems/rotate-list/
 # Given the head of a linked list, rotate the list to the right by k places.

 # Constraints:
 # The number of nodes in the list is in the range [0, 500].
 # -100 <= Node.val <= 100
 # 0 <= k <= 2 * 109
 */


 /// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
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
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil || k == 0 {
            return head
        }
        var length = 1
        var tail = head
        while tail?.next != nil {
            tail = tail?.next
            length += 1
        }

        if k % length == 0 {
            return head
        }

        tail?.next = head
        var newHead = tail
        for _ in 0..<(length - k % length) {
            tail = tail!.next
        }
        newHead = tail?.next
        tail!.next = nil
        return newHead
    }
}

let head = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))
print(head)
print(Solution().rotateRight(head, 2)!)
