import Foundation

/**
 # https://leetcode.com/problems/merge-two-sorted-lists/
 # Merge two sorted linked lists and return it as a sorted list.
 # The list should be made by splicing together the nodes of the first two lists.
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
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil {
            return l2
        }
        if l2 == nil {
            return l1
        }
        if l1!.val < l2!.val {
            l1?.next = mergeTwoLists(l1?.next, l2)
            return l1
        } else {
            l2?.next = mergeTwoLists(l1, l2?.next)
            return l2
        }
    }
    
    func mergeTwoLists1(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        var cur: ListNode? = dummy
        var first: ListNode? = l1
        var second: ListNode? = l2
        while first != nil && second != nil {
            if first!.val < second!.val {
                cur?.next = first!
                first = first?.next
            } else {
                cur?.next = second!
                second = second?.next
            }
            cur = cur!.next
        }
        if first != nil {
            cur!.next = first
        }
        if second != nil {
            cur!.next = second
        }
        return dummy.next
    }
}

let l1 = ListNode(1, ListNode(2, ListNode(4)))
let l2 = ListNode(1, ListNode(3, ListNode(4)))
print(Solution().mergeTwoLists1(l1, l2))
