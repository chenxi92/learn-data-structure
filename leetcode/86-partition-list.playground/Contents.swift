import UIKit

/**
 Definition for singly-linked list.
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
            return "\(self.val) -> \(self.next!.description)"
        } else {
            return "\(self.val)"
        }
    }
}
 
class Solution {
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        var small = ListNode(0)
        let smallHead = small
        var large = ListNode(0)
        let largeHead = large
        var cur = head
        while cur != nil {
            if cur!.val < x {
                small.next = cur!
                small = small.next!
            } else {
                large.next = cur!
                large = large.next!
            }
            cur = cur?.next
        }
        small.next = largeHead.next
        large.next = nil
        return smallHead.next
    }
}

let head = ListNode(1, ListNode(4, ListNode(3, ListNode(2, ListNode(5, ListNode(2))))))
print(head)
print(Solution().partition(head, 3)!)
