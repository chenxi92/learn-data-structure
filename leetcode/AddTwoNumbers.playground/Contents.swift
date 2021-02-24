import Foundation

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
        var result = "\(val)"
        var node = next
        while (node != nil) {
            result += " -> \(node!.val)"
            node = node?.next
        }
        return result
    }
}

/**
 给你两个 非空 的链表，表示两个非负的整数。它们每位数字都是按照 逆序 的方式存储的，并且每个节点只能存储 一位 数字。

 请你将两个数相加，并以相同形式返回一个表示和的链表。

 你可以假设除了数字 0 之外，这两个数都不会以 0 开头。
 */

class Solution {
    func addTowNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = l1
        var l2 = l2
        var head: ListNode? = nil
        var tail: ListNode? = nil
        var carry = 0 /// 相加之后是否向前进一位
        while ((l1 != nil) || (l2 != nil)) {
            let n1 = l1?.val ?? 0
            let n2 = l2?.val ?? 0
            let sum = n1 + n2 + carry

            if (head == nil) {
                tail = ListNode(sum % 10)
                head = tail /// head 指向 tail 地址
            } else {
                // head最后一个节点和tail节点 指向同一个地址
                tail?.next = ListNode(sum % 10)
                tail = tail?.next
            }

            carry = sum / 10
            l1 = l1?.next ?? nil
            l2 = l2?.next ?? nil
        }
        
        if carry > 0 {
            tail?.next = ListNode(carry)
        }
        
        return head
    }
    
    func addTowNumbers1(_ l1: ListNode?, _ l2: ListNode?, _ carry: Int = 0) -> ListNode? {
        if (l1 == nil) && (l2 == nil) && carry == 0 {
            return nil
        }
        let sum = (l1?.val ?? 0) + (l2?.val ?? 0) + carry
        return ListNode(sum % 10, addTowNumbers1(l1?.next, l2?.next, sum/10))
    }
}


let solution = Solution()
let l1 = ListNode(2 , ListNode(4, ListNode(5)))
let l2 = ListNode(5, ListNode(6, ListNode(4)))
print(solution.addTowNumbers(l1, l2)!)
print(solution.addTowNumbers(l1, l2)!)
