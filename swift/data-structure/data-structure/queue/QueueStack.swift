import Foundation

public struct QueueStack<T> : MyQueue {
    public typealias Element = T
    private var leftStack: [T] = []
    private var rightStack: [T] = []
    public init() {}
    
    @discardableResult
    public mutating func enqueue(_ element: T) -> Bool {
        rightStack.append(element)
        return true
    }
    
    public mutating func dequeue() -> T? {
        if leftStack.isEmpty {
            leftStack = rightStack.reversed()
            rightStack.removeAll()
        }
        return leftStack.popLast()
    }
    
    public var isEmpty: Bool {
        return leftStack.isEmpty && rightStack.isEmpty
    }
    
    public var peek: T? {
        return !leftStack.isEmpty ? leftStack.last : rightStack.first
    }
}

extension QueueStack: CustomStringConvertible {
    public var description: String {
        let printList = leftStack + rightStack.reversed()
        return printList.description
    }
}


func QueueStackTest() {
    example(of: "queue stack") {
        var queue = QueueStack<String>()
        print(queue.enqueue("Ray"))
        print(queue.enqueue("Brian"))
        print(queue.enqueue("Dric"))

        print(queue)
        print(queue.dequeue()!)

        print(queue)

        print(queue.peek!)
    }
}
