import Foundation

public struct QueueArray<T>: MyQueue {
    
    public typealias Element = T
    
    private var array: [T] = []
    public init() {}
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var peek: T? {
        return array.first
    }
    
    public mutating func enqueue(_ element: T) -> Bool {
        array.append(element)
        return true
    }
    
    public mutating func dequeue() -> T? {
        return isEmpty ? nil : array.removeFirst()
    }
}

extension QueueArray: CustomStringConvertible {
    public var description: String {
        return array.description
    }
}

func QueueArrayTest() {
    example(of: "queue array") {
        var queue = QueueArray<String>()
        print(queue.enqueue("Ray"))
        print(queue.enqueue("Brian"))
        print(queue.enqueue("Dric"))

        print(queue)
        print(queue.dequeue()!)

        print(queue)

        print(queue.peek!)
    }
}
