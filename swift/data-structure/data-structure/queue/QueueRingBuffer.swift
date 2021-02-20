import Foundation

public struct QueueRingBuffer<T>: MyQueue {
    public typealias Element = T
    
    private var ringBuffer: RingBuffer<T>
    
    public init(count: Int) {
        ringBuffer = RingBuffer<T>(count: count)
    }
    
    public var isEmpty: Bool {
        return ringBuffer.isEmpty
    }
    
    public var peek: T? {
        return ringBuffer.first
    }
    
    public mutating func enqueue(_ element: T) -> Bool {
        return ringBuffer.write(element)
    }
    
    public mutating func dequeue() -> T? {
        return ringBuffer.read()
    }
}

func QueueRingBufferTest() {
    example(of: "queue ring buffer") {
        var queue = QueueRingBuffer<String>(count: 10)
        print(queue.enqueue("Ray"))
        print(queue.enqueue("Brian"))
        print(queue.enqueue("Eric"))
        print(queue.dequeue()!)
        print(queue.peek!)
    }
}
