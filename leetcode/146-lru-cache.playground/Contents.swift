/**
 https://leetcode.com/problems/lru-cache/
 
 Design a data structure that follows the constraints of a Least Recently Used (LRU) cache.

 Implement the LRUCache class:

 LRUCache(int capacity) Initialize the LRU cache with positive size capacity.
 
 int get(int key) Return the value of the key if the key exists, otherwise return -1.
 
 void put(int key, int value) Update the value of the key if the key exists.
 Otherwise, add the key-value pair to the cache.
 If the number of keys exceeds the capacity from this operation, evict the least recently used key.
 
 The functions get and put must each run in O(1) average time complexity.
 */
import Foundation

class LinkNode<T> {
    var payload: T
    var next: LinkNode?
    var previous: LinkNode?
    
    init(_ payload: T, _ next: LinkNode? = nil, _ previous: LinkNode? = nil) {
        self.payload = payload
        self.next = next
        self.previous = previous
    }
}

extension LinkNode: Equatable where T: Equatable {
    static func == (lhs: LinkNode<T>, rhs: LinkNode<T>) -> Bool {
        unsafeBitCast(lhs, to: Int.self) == unsafeBitCast(rhs, to: Int.self)
    }
}

extension LinkNode: Hashable where T: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(payload)
        hasher.combine(previous?.payload)
        hasher.combine(next?.payload)
    }
}

class DoubleLinkNode<T: Hashable> {
    private var head: LinkNode<T>? = nil
    private var tail: LinkNode<T>? = nil
    private(set) var count: Int = 0
    
    func addToHead(_ node: LinkNode<T>) {
        defer {
            head = node
            count += 1
        }
        
        guard let head = head else {
            tail = node
            return
        }
        
        head.previous = node
        node.previous = nil
        node.next = head
    }
    
    func removeLast() -> LinkNode<T>? {
        guard let lastNode = self.tail else {
            return nil
        }
        let previous = lastNode.previous
        previous?.next = nil
        
        self.tail = previous
        self.tail?.next = nil
        
        if count == 1 {
            head = nil
        }
        count -= 1
        
        return lastNode
    }
    
    func bringToHead(_ node: LinkNode<T>) {
        guard node !== head else {
            return
        }
        
        let previous = node.previous
        let next = node.next
        
        // connect previous and next
        previous?.next = next
        next?.previous = previous
        
        // connect head and node
        node.next = head
        node.previous = nil
        head?.previous = node
        
        if node === tail {
            tail = previous
        }
        
        head = node
    }
}

class LRUCache {
    private struct Payload: Hashable {
        let key: Int
        let value: Int
    }
    
    private var nodesMap: [Int: LinkNode<Payload>] = [:]
    private var list: DoubleLinkNode = DoubleLinkNode<Payload>()
    private var capacity: Int
    
    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        guard let node = nodesMap[key] else {
            return -1
        }
        list.bringToHead(node)
        return node.payload.value
    }
    
    func put(_ key: Int, _ value: Int) {
        let payload = Payload(key: key, value: value)
        if let cachedNode = nodesMap[key] {
            cachedNode.payload = payload
            list.bringToHead(cachedNode)
        } else {
            let node = LinkNode(payload)
            list.addToHead(node)
            nodesMap[key] = node
        }

        
        if list.count > capacity {
            let lastNode = list.removeLast()
            if let key = lastNode?.payload.key {
                nodesMap[key] = nil
            }
        }
        
    }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */

let obj = LRUCache(2)
obj.put(1, 1)
obj.put(2, 2)

print(obj.get(1))

obj.put(3, 3)

print(obj.get(2))

obj.put(4, 4)

print(obj.get(1))
print(obj.get(3))
print(obj.get(4))
