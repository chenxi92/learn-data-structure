import Foundation

/// 给定一个链表，判断链表中是否有环。
/// 如果链表中有某个节点，可以通过连续跟踪 next 指针再次到达该节点，则链表中存在环。
/// 如果链表中存在环，则返回 true，否则返回 false。

public class ListNode {
    public var value: Int
    public var next: ListNode?
    init(_ value: Int, _ next: ListNode? = nil) {
        self.value = value
        self.next = next
    }
}


extension ListNode: Equatable {
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return (lhs.value == rhs.value) && (lhs.next == rhs.next)
    }
}

extension ListNode: CustomStringConvertible {
    public var description: String {
        if self.next != nil {
            return "\(self.value) -> \(self.next!)"
        }
        return "\(self.value)"
    }
}

func hasCycle(_ head: ListNode?) -> Bool {
    if head == nil || head?.next == nil {
        return false
    }
    
    var slow: ListNode? = head
    var fast: ListNode? = head?.next
    while fast != nil && fast?.next != nil {
        if slow == fast {
            return true
        }
        slow = slow?.next
        fast = fast?.next?.next
    }
    return false
}

func hasCycle1(_ head: ListNode?) -> Bool {
    var aSet = Set<Int>()
    var cur = head
    while cur != nil {
        if aSet.contains(cur!.value) {
            return true
        } else {
            aSet.insert(cur!.value)
            cur = cur?.next
        }
    }
    return false
}

let node5 = ListNode(5, nil)
let node4 = ListNode(4, node5)
let node3 = ListNode(3, node4)
let ndoe2 = ListNode(2, node3)
let head  = ListNode(1, ndoe2)
node5.next = head
//print(head)
print(hasCycle(head))
print("---")
