import UIKit

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
            return "\(self.val)->\(self.next!.description)"
        }
        return "\(self.val)"
    }
}
class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var ans: ListNode?
        for node in lists {
            ans = self.mergeTwoList(ans, node)
        }
        return ans
    }
    
    func mergeTwoList(_ l1:ListNode?, _ l2:ListNode?) ->ListNode? {
        if(l1 == nil) {
            return l2
        }
        if(l2 == nil) {
            return l1
        }
        var result:ListNode?
        if(l1!.val <= l2!.val) {
            result = l1
            result!.next = mergeTwoList(l1!.next,l2)
        }
        else {
            result = l2
            result!.next = mergeTwoList(l1,l2!.next)
        }
        return result
    }
}

let l1 = ListNode(1, ListNode(4, ListNode(5)))
let l2 = ListNode(1, ListNode(3, ListNode(4)))
let l3 = ListNode(2, ListNode(6))
let lists = [l1, l2, l3]
print("--- begin merge ---")
for node in lists {
    print(node)
}
print("--- after merge ---")
print(Solution().mergeTwoList(l1, l2)!)
print("method 1", Solution().mergeKLists(lists)!)
