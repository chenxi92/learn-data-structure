import Foundation

/**
 # https://leetcode.com/problems/remove-nth-node-from-end-of-list/

 # Given the head of a linked list, remove the nth node from the end of the list and return its head.
 # Follow up: Could you do this in one pass?

 # Constraints:
 # The number of nodes in the list is sz.
 # 1 <= sz <= 30
 # 0 <= Node.val <= 100
 # 1 <= n <= sz
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
        guard self.next != nil else {
            return "\(self.val) -> None"
        }
        return "\(self.val) -> " + self.next!.description
    }
}

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummy = ListNode(0)
        dummy.next = head
        var lenth = 0
        var first = head
        while first != nil {
            lenth += 1
            first = first?.next
        }
        lenth -= n
        first = dummy
        while lenth > 0 {
            lenth -= 1
            first = first?.next
        }
        first?.next = first?.next?.next
        return dummy.next
    }
    
    func removeNthFromEnd1(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummy = ListNode(0)
        dummy.next = head
        var first: ListNode? = dummy
        var second: ListNode? = dummy
        for _ in 0...n {
            first = first?.next
        }
        while first != nil {
            first = first?.next
            second = second?.next
        }
        second?.next = second?.next?.next
        return dummy.next
    }
}

let head = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))
print(Solution().removeNthFromEnd(head, 1)!)

let head1 = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))
print(Solution().removeNthFromEnd1(head1, 1)!)


