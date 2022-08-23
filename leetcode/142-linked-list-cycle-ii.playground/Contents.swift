/**
 https://leetcode.com/problems/linked-list-cycle-ii/
 
 Given the head of a linked list, return the node where the cycle begins. If there is no cycle, return null.

 There is a cycle in a linked list if there is some node in the list that can be reached again by continuously following the next pointer. Internally, pos is used to denote the index of the node that tail's next pointer is connected to (0-indexed). It is -1 if there is no cycle. Note that pos is not passed as a parameter.

 Do not modify the linked list.
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
    func detectCycle(_ head: ListNode?) -> ListNode? {
        var container: Set<ListNode> = []
        var cur = head
        while cur != nil {
            if container.contains(cur!) {
                return cur
            } else {
                container.insert(cur!)
            }
            cur = cur?.next
        }
        return nil
    }
    
    func detectCycle1(_ head: ListNode?) -> ListNode? {
        var dic: [ListNode: Int] = [:]
        var cur = head
        while cur != nil {
            if let _ = dic[cur!] {
                return cur
            } else {
                dic[cur!] = 1
            }
            cur = cur?.next
        }
        return nil
    }
}


let node1 = ListNode(3)
let node2 = ListNode(2)
let node3 = ListNode(0)
let node4 = ListNode(-4)
node1.next = node2
node2.next = node3
node3.next = node4

print(Solution().detectCycle(node1)?.val ?? "no cycle")
print(Solution().detectCycle1(node1)?.val ?? "no cycle")

node4.next = node2

print(Solution().detectCycle(node1)?.val ?? "no cycle")
print(Solution().detectCycle1(node1)?.val ?? "no cycle")


