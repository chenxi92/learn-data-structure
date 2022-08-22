/**
 https://leetcode.com/problems/linked-list-cycle/
 
 Given head, the head of a linked list, determine if the linked list has a cycle in it.

 There is a cycle in a linked list if there is some node in the list that can be reached again by continuously following the next pointer. Internally, pos is used to denote the index of the node that tail's next pointer is connected to. Note that pos is not passed as a parameter.

 Return true if there is a cycle in the linked list. Otherwise, return false.
 */
import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

extension ListNode: Equatable {
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        unsafeBitCast(lhs, to: Int.self) == unsafeBitCast(rhs, to: Int.self)
    }
}

extension ListNode: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(val)
        hasher.combine(next?.val)
    }
}

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        var dic: [ListNode: Int] = [:]
        var cur = head
        while cur != nil {
            if let _ = dic[cur!] {
                return true
            } else {
                dic[cur!] = 1
            }
            cur = cur?.next
        }
        return false
    }
    
    func hasCycle1(_ head: ListNode?) -> Bool {
        guard head != nil && head!.next != nil && head!.next!.next != nil else {
            return false
        }
        var slow: ListNode? = head
        var fast: ListNode? = head?.next?.next
        while fast != nil {
            if slow == fast {
                return true
            }
            slow = slow?.next
            fast = fast?.next?.next
        }
        return false
    }
}

let node1 = ListNode(3)
let node2 = ListNode(2)
let node3 = ListNode(0)
let node4 = ListNode(-4)
node1.next = node2
node2.next = node3
node3.next = node4

assert(Solution().hasCycle(node1) == false)
assert(Solution().hasCycle1(node1) == false)

print("\n")

node4.next = node2

assert(Solution().hasCycle(node1))
assert(Solution().hasCycle1(node1))

print("--- passed test")

