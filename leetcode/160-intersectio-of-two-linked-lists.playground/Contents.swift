/**
 https://leetcode.com/problems/intersection-of-two-linked-lists/
 
 Given the heads of two singly linked-lists headA and headB, return the node at which the two lists intersect. If the two linked lists have no intersection at all, return null.

 For example, the following two linked lists begin to intersect at node c1:


 The test cases are generated such that there are no cycles anywhere in the entire linked structure.

 Note that the linked lists must retain their original structure after the function returns.

 Custom Judge:

 The inputs to the judge are given as follows (your program is not given these inputs):

 intersectVal - The value of the node where the intersection occurs. This is 0 if there is no intersected node.
 listA - The first linked list.
 listB - The second linked list.
 skipA - The number of nodes to skip ahead in listA (starting from the head) to get to the intersected node.
 skipB - The number of nodes to skip ahead in listB (starting from the head) to get to the intersected node.
 The judge will then create the linked structure based on these inputs and pass the two heads, headA and headB to your program. If you correctly return the intersected node, then your solution will be accepted.
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

extension ListNode: Hashable {
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        unsafeBitCast(lhs, to: Int.self) == unsafeBitCast(rhs, to: Int.self)
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(next)
    }
}

extension ListNode: CustomStringConvertible {
    public var description: String {
        if let next = next {
            return "\(val) -> \(next.description)"
        } else {
            return "\(val)"
        }
    }
}

class Solution {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var currentA = headA
        var currentB = headB
        
        /// consider headA length is: a + c, headB length is: b + c
        /// c means the intersection node's length, at least is 0
        /// because a + c + (b + c) = b + c + (a + c)
        /// so no mater what c is, currentA and currentB will meet at: a + c + b or b + c + a steps.
        
        /// Swift use !== and === to compare reference type
        while currentA !== currentB {
            if currentA == nil {
                currentA = headB
            } else {
                currentA = currentA?.next
            }
            
            if currentB == nil {
                currentB = headA
            } else {
                currentB = currentB?.next
            }
        }
        
        /// If has intersection node, both A and B are the same
        /// If not found intersection node, both A and B are nil
        return currentA
    }

    func getIntersectionNode1(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var map: [ListNode: Int] = [:]
        var currentA = headA
        while currentA != nil {
            map[currentA!] = currentA!.val
            currentA = currentA?.next
        }
        var currentB = headB
        while currentB != nil {
            if let _ = map[currentB!] {
                return currentB!
            } else {
                currentB = currentB?.next
            }
        }
        return nil
    }
}

var node8 = ListNode(8)
let node4 = ListNode(4)
let node5 = ListNode(5)
node8.next = node4
node4.next = node5

let headA = ListNode(4)
headA.next = ListNode(1)
headA.next?.next = node8

let headB = ListNode(5)
headB.next = ListNode(6)
headB.next?.next = ListNode(1)
headB.next?.next?.next = node8


if let intersectionNode = Solution().getIntersectionNode1(headA, headB) {
    print(intersectionNode)
} else {
    print("not find intersection node")
}
