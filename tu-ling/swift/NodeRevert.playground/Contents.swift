import Foundation

class ListNode {
    public var value: Int
    public var next: ListNode?
    
    init(_ value: Int, _ next: ListNode?) {
        self.value = value
        self.next = next
    }
}

extension ListNode: CustomStringConvertible {
    var description: String {
        if let next = self.next {
            return "\(self.value)->\(next)"
        } else {
            return "\(self.value)"
        }
    }
}

func iterate(_ head: ListNode) -> ListNode? {
    var prev: ListNode? = nil
    var next: ListNode? = nil
    var cur: ListNode? = head
    while cur != nil {
        next = cur?.next
        cur?.next = prev
        prev = cur
        cur = next
    }
    return prev
}

func recursion(_ head: ListNode?) -> ListNode? {
    guard head != nil, head?.next != nil else {
        return head
    }
    let newHead = recursion(head?.next)
    
    head?.next?.next = head
    head?.next = nil
    return newHead
}

let node5 = ListNode(5, nil)
let node4 = ListNode(4, node5)
let node3 = ListNode(3, node4)
let node2 = ListNode(2, node3)
let node1 = ListNode(1, node2)

print(node1)

if let head = iterate(node1) {
    print("after iterate revert: ", head)
    
    if let head = recursion(head) {
        print("after recursion revert: ", head)
    }

}

