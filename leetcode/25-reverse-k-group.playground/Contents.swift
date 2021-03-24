import UIKit

/**
 # https://leetcode.com/problems/reverse-nodes-in-k-group/

 # Given a linked list, reverse the nodes of a linked list k at a time
 # and return its modified list. k is a positive integer and is less than or
 # equal to the length of the linked list. If the number of nodes is not a
 # multiple of k then left-out nodes, in the end, should remain as it is.

 # Follow up:
 # Could you solve the problem in O(1) extra memory space?
 # You may not alter the values in the list's nodes,
 # only nodes itself may be changed.

 # Constraints:
 # The number of nodes in the list is in the range sz.
 # 1 <= sz <= 5000
 # 0 <= Node.val <= 1000
 # 1 <= k <= sz
*/

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
            return "\(self.val)->\(self.next!.description)"
        } else {
            return "\(self.val)"
        }
    }
}

public class Solution {
    
    func reverse(_ head: ListNode?, _ tail: ListNode?) -> (ListNode?, ListNode?) {
        var prev = tail?.next
        var cur = head
        while prev !== tail {
            let next = cur?.next
            cur?.next = prev
            prev = cur
            cur = next
        }
        return (tail, head)
    }
    
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        let sentinel = ListNode(0)
        sentinel.next = head
        var prev: ListNode? = sentinel
        var start = head
        while prev != nil {
            var end = prev
            /// skip left-out
            for _ in 0..<k {
                end = end?.next
                if end == nil {
                    return sentinel.next
                }
            }

            let next = end?.next
            (start, end) = self.reverse(start, end)
            
            /// reconnect list
            prev?.next = start
            end?.next = next
            prev = end
            start = end?.next
        }
        return sentinel.next
    }
}

let head = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))
//let tail = head.next?.next?.next
print("head = ", head)
//print("tail = ", tail!)
//print("--- after reverse ---")
//let (end, start) = (Solution().reverse(head, tail))
//print("head = ", start!)
//print("tail = ", end!)
print("after reverse: \n", Solution().reverseKGroup(head, 2)!)
