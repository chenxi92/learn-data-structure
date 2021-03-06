import Foundation

/**
 # https://leetcode.com/problems/swap-nodes-in-pairs/
 
 # Given a linked list, swap every two adjacent nodes and return its head.
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
    func swapPairs(_ head: ListNode?) -> ListNode? {
        guard let node = head, let next = head?.next else {
            return head
        }
        swap(&node.val, &next.val)
        swapPairs(next.next)
        return head
    }
}

let head = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))
print(head)
print(Solution().swapPairs(head) ?? ListNode(0))
