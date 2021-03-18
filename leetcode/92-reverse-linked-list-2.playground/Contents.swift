import Foundation

/**
 # https://leetcode.com/problems/reverse-linked-list-ii/
 
 # Given the head of a singly linked list and two integers left and right
 # where left <= right, reverse the nodes of the list from position left to
 # position right, and return the reversed list.

 # Constraints:
 # The number of nodes in the list is n.
 # 1 <= n <= 500
 # -500 <= Node.val <= 500
 # 1 <= left <= right <= n
 */

/**
 * Definition for singly-linked list.
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
            return "\(self.val) -> \(self.next!.description)"
        } else {
            return "\(self.val)"
        }
    }
}

//extension ListNode: Equatable {
//    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
//        return lhs.val == rhs.val
//    }
//}

class Solution {

    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        if head == nil {
            return nil
        }
        
        let dummy = ListNode(0)
        dummy.next = head
        
        var pre: ListNode? = dummy
        for _ in 1..<left {
            pre = pre?.next
        }
        
        
        let start: ListNode? = pre?.next
        var end: ListNode? = start?.next
        for _ in 0..<(right - left) {
            start?.next = end?.next
            end?.next = pre?.next
            pre?.next = end
            end = start?.next
        }
        
        return dummy.next
    }
}

var head = ListNode(7, ListNode(9, ListNode(2, ListNode(10, ListNode(1, ListNode(8, ListNode(6)))))))
print(head)
print("\nresult is: ", Solution().reverseBetween(head, 3, 6)!)

//head = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))
//print(head)
//print(Solution().reverseBetween(head, 2, 4)!)
