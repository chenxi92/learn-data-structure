/**
 https://leetcode.com/problems/copy-list-with-random-pointer/
 
 A linked list of length n is given such that each node contains an additional random pointer, which could point to any node in the list, or null.

 Construct a deep copy of the list. The deep copy should consist of exactly n brand new nodes, where each new node has its value set to the value of its corresponding original node. Both the next and random pointer of the new nodes should point to new nodes in the copied list such that the pointers in the original list and copied list represent the same list state. None of the pointers in the new list should point to nodes in the original list.

 For example, if there are two nodes X and Y in the original list, where X.random --> Y, then for the corresponding two nodes x and y in the copied list, x.random --> y.

 Return the head of the copied linked list.

 The linked list is represented in the input/output as a list of n nodes. Each node is represented as a pair of [val, random_index] where:

 val: an integer representing Node.val
 random_index: the index of the node (range from 0 to n-1) that the random pointer points to, or null if it does not point to any node.
 Your code will only be given the head of the original linked list.
 */
import Foundation

public class Node {
    public var val: Int
    public var next: Node?
    public var random: Node?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
        self.random = nil
    }
}

class Solution {
    func copyRandomList(_ head: Node?) -> Node? {
        
        var iter = head
        var next: Node? = nil
        
        /// First: make copy of each noce
        /// add link them together side-by-side in a single list.
        while iter != nil {
            next = iter?.next
            
            let copy = Node(iter!.val)
            iter!.next = copy
            copy.next = next
            
            iter = next
        }
        
        /// Second: assign random pointers for the copy nodes.
        iter = head
        while iter != nil {
            if iter!.random != nil {
                iter?.next?.random = iter?.random?.next // the next node of the iter's random is the copy node
            }
            iter = iter?.next?.next
        }
        
        /// Third: restore the original list, and extract the copy list.
        iter = head
        let pseduoHead = Node(0)
        var copy: Node? = pseduoHead
        var copyIter: Node? = pseduoHead
        
        while iter != nil {
            next = iter?.next?.next
            
            // extract the copy
            copy = iter?.next
            copyIter?.next = copy
            copyIter = copy
            
            // restore the original list
            iter!.next = next
            
            iter = next
        }
        return pseduoHead.next
    }
}

print("--- passed test")
