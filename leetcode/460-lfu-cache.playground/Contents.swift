/**
 https://leetcode.com/problems/lfu-cache/
 
 Design and implement a data structure for a Least Frequently Used (LFU) cache.

 Implement the LFUCache class:

 LFUCache(int capacity) Initializes the object with the capacity of the data structure.
 
 int get(int key) Gets the value of the key if the key exists in the cache. Otherwise, returns -1.
 
 void put(int key, int value) Update the value of the key if present, or inserts the key if not already present.
 When the cache reaches its capacity, it should invalidate and remove the least frequently used key before inserting a new item.
 For this problem, when there is a tie (i.e., two or more keys with the same frequency), the least recently used key would be invalidated.
 To determine the least frequently used key, a use counter is maintained for each key in the cache. The key with the smallest use counter is the least frequently used key.

 When a key is first inserted into the cache, its use counter is set to 1 (due to the put operation). The use counter for a key in the cache is incremented either a get or put operation is called on it.

 The functions get and put must each run in O(1) average time complexity.
 */
import Foundation

class Node {
    var key: Int
    var value: Int
    var frequency: Int = 1
    var next: Node? = nil
    var previous: Node? = nil
    
    init(_ key: Int, _ value: Int) {
        self.key = key
        self.value = value
    }
}

class DoubleLinkList {
    var head: Node
    var tail: Node
    
    var isEmpty: Bool {
        head.next === tail && tail.previous === head
    }
    
    init(_ node: Node) {
        self.head = Node(0, 0)
        self.tail = Node(0, 0)
        
        self.head.next = node
        node.previous = self.head
        
        node.next = self.tail
        self.tail.previous = node
    }
    
    func addToHead(_ node: Node) {
        node.previous = head
        node.next = head.next
        
        head.next?.previous = node
        head.next = node
    }
    
    func remove(_ node: Node) {
        node.previous?.next = node.next
        node.next?.previous = node.previous
    }
    
    func removeLast() -> Node {
        let node = tail.previous!
        remove(node)
        return node
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        "(k=\(key), v=\(value), f=\(frequency))"
    }
}

extension DoubleLinkList: CustomStringConvertible {
    var description: String {
        var messages: [String] = []
        var cur: Node? = head
        while cur != nil {
            let message = "(k=\(cur!.key); v=\(cur!.value); f=\(cur!.frequency))"
            messages.append(message)
            cur = cur?.next
        }
        return messages.joined(separator: " -> ")
    }
}

class LFUCache {
    private var capacity: Int
    
    /// The min reference count for all nodes in the cache
    private var minFrequency: Int = Int.max
    
    /// The number of nodes in the caches
    private var count: Int = 0
    
    /// key: Node
    private var nodeMap: [Int: Node] = [:]
    
    /// count: Double link
    private var countMap: [Int: DoubleLinkList] = [:]
    
    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    private func debug(_ function: String = #function) {
        print("invoked \(function)")
        print("count = \(count)")
        print("minFrequency = \(minFrequency)")
        print("nodeMap: ")
        for pair in nodeMap {
            print("\(pair.key): \(pair.value)")
        }
        print("countMap: ")
        for pair in countMap {
            print("\(pair.key): \(pair.value)")
        }
        print("\n")
    }
    
    func get(_ key: Int) -> Int {
        print("get: \(key)")
        defer { debug() }
        
        if let cachedNode = nodeMap[key] {
            update(cachedNode)
            return cachedNode.value
        }
        return -1
    }
    
    func put(_ key: Int, _ value: Int) {
        print("put: \(key)-\(value)")
        defer { debug() }
        
        guard capacity > 0 else { return }
        
        if let cachedNode = nodeMap[key] {
            // already exist key, update the new value
            cachedNode.value = value
            update(cachedNode)
            return
        }
        
        if capacity == count {
            if let minLink = countMap[minFrequency] {
                let lastNode = minLink.removeLast()
                nodeMap[lastNode.key] = nil
                count -= 1
                print("after delete countMap[\(minFrequency)], node = \(lastNode)")
            }
        }
        
        let newNode = Node(key, value)
        nodeMap[key] = newNode
        
        if let firstList = countMap[1] {
            firstList.addToHead(newNode)
        } else {
            countMap[1] = DoubleLinkList(newNode)
        }
        count += 1
        minFrequency = 1
    }
    
    private func update(_ node: Node) {
        guard let list = countMap[node.frequency] else { return }
        
        // delete the old node
        list.remove(node)
        
        // update date the min reference count
        if node.frequency == minFrequency && list.isEmpty {
            minFrequency += 1
        }
        
        node.frequency += 1
        
        if let newList = countMap[node.frequency] {
            newList.addToHead(node)
        } else {
            countMap[node.frequency] = DoubleLinkList(node)
        }
    }
}


let obj = LFUCache(3)
obj.put(2, 2)
obj.put(1, 1)

assert(obj.get(2) == 2)
assert(obj.get(1) == 1)
assert(obj.get(2) == 2)

obj.put(3, 3)
obj.put(4, 4)

assert(obj.get(3) == -1)
assert(obj.get(2) == 2)
assert(obj.get(1) == 1)
assert(obj.get(4) == 4)

obj.put(5, 5)
assert(obj.get(4) == -1)

obj.put(3, 3)
assert(obj.get(5) == -1)

print("passed test")
