//
//  LRUCache.swift
//  data-structure
//
//  Created by chenxi on 2020/7/1.
//  Copyright © 2020 chenxi. All rights reserved.
//

import Foundation

// https://marcosantadev.com/implement-cache-lru-swift

typealias DoublyLinedListNode<T> = DoublyLinkedList<T>.Node<T>

final class DoublyLinkedList<T> {
    
    final class Node<T> {
        var payload: T
        var previous: Node<T>?
        var next: Node<T>?
        
        init(payload: T) {
            self.payload = payload
        }
    }
    
    private(set) var count: Int = 0
    
    private var head: Node<T>?
    private var tail: Node<T>?
    
    func addHead(_ payload: T) -> Node<T> {
        let node = Node(payload: payload)
        defer {
            head = node
            count += 1
        }
        
        guard let head = head else {
            tail = node
            return node
        }
        
        head.previous = node
        
        node.previous = nil
        node.next = head
        
        return node
    }
    
    func moveToHead(_ node: Node<T>) {
        guard node !== head else { return }
        let previous = node.previous
        let next = node.next
        
        previous?.next = next
        next?.previous = previous
        
        node.next = head
        node.previous = nil
        
        if node === tail {
            tail = previous
        }
        self.head = node
    }
    
    func removeLast() -> Node<T>? {
        guard let tail = self.tail else { return nil }
        
        let previous = tail.previous
        previous?.next = nil
        self.tail = previous
        
        if count == 1 {
            head = nil
        }
        
        count -= 1
        
        return tail
    }
}

final class CacheLRU<Key: Hashable, Value> {
    
    private struct CachePayload {
        let key: Key
        let value: Value
    }
    
    private let list = DoublyLinkedList<CachePayload>()
    private var nodesDict = [Key: DoublyLinedListNode<CachePayload>]()
    
    private let capacity: Int
    
    init(capacity: Int) {
        self.capacity = max(0, capacity)
    }
    
    func setValue(_ value: Value, for key: Key) {
        let payload = CachePayload(key: key, value: value)
        
        if let node = nodesDict[key] {
            node.payload = payload
            list.moveToHead(node)
        } else {
            let node = list.addHead(payload)
            nodesDict[key] = node
        }
        
        if list.count > capacity {
            let nodeRemoved = list.removeLast()
            if let key = nodeRemoved?.payload.key {
                nodesDict[key] = nil
            }
        }
    }
    
    func getValue(for key: Key) -> Value? {
        guard let node = nodesDict[key] else { return nil }
        
        list.moveToHead(node)
        
        return node.payload.value
    }
    
}
