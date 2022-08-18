/**
 https://leetcode.com/problems/convert-sorted-list-to-binary-search-tree/
 
 Given the head of a singly linked list where elements are sorted in ascending order, convert it to a height balanced BST.

 For this problem, a height-balanced binary tree is defined as a binary tree in which the depth of the two subtrees of every node never differ by more than 1.

 */
import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

extension ListNode: Equatable {
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        lhs.val == rhs.val
    }
}

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        var array: [Int] = []
        var listNode = head
        while listNode != nil {
            array.append(listNode!.val)
            listNode = listNode?.next
        }
        return buildBST(array, low: 0, high: array.count - 1)
    }
    
    private func buildBST(_ nums: [Int], low: Int, high: Int) -> TreeNode? {
        if low > high {
            return nil
        }
        let mid = low + (high - low) / 2
        let root = TreeNode(nums[mid])
        root.left = buildBST(nums, low: low, high: mid - 1)
        root.right = buildBST(nums, low: mid + 1, high: high)
        return root
    }
    
    func sortedListToBST1(_ head: ListNode?) -> TreeNode? {
        guard head != nil else { return nil }
        return buildBST(head: head!, tail: nil)
    }
    
    private func buildBST(head: ListNode?, tail: ListNode?) -> TreeNode? {
        if head == tail {
            return nil
        }
        
        var slow: ListNode? = head
        var fast: ListNode? = head
        
        while fast != tail && fast?.next != tail {
            fast = fast?.next?.next
            slow = slow?.next
        }
        
        let root = TreeNode(slow!.val)
        root.left = buildBST(head: head, tail: slow)
        root.right = buildBST(head: slow?.next, tail: tail)
        return root
    }
}

let head = ListNode(-10, ListNode(-3, ListNode(0, ListNode(5, ListNode(9)))))
print(Solution().sortedListToBST(head) ?? "empty")
