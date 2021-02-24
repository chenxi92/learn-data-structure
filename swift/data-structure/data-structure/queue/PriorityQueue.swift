//
//  PriorityQueue.swift
//  data-structure
//
//  Created by peak on 2021/2/22.
//  Copyright © 2021 chenxi. All rights reserved.
//

import Foundation

struct PriorityQueue<Element>: MyQueue {
    private var heap: Heap<Element>
    
    init(sort: @escaping (Element, Element) -> Bool, elements: [Element] = []) {
        heap = Heap(array: elements, sort: sort)
    }
    
    mutating func enqueue(_ element: Element) -> Bool {
        heap.insert(element)
        return true
    }
    
    mutating func dequeue() -> Element? {
        return heap.remove()
    }
    
    var isEmpty: Bool {
        return heap.isEmpty
    }
    
    var peek: Element? {
        return heap.peak()
    }
}

func PriorityQueueTest() {
    example(of: "test priority queue") {
        var priorityQueue = PriorityQueue(sort: >, elements: [1, 12, 3, 4, 1, 6, 8, 7])
        while !priorityQueue.isEmpty {
            print(priorityQueue.dequeue()!)
        }
    }
}
