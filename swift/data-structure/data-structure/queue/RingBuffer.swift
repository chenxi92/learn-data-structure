import Foundation

public struct RingBuffer<T> {
    /// Ispired by
    /// https://github.com/raywenderlich/swift-algorithm-club/tree/master/Ring%20Buffer
    
    fileprivate var array: [T?]
    fileprivate var readIndex = 0
    fileprivate var writeIndex = 0
    
    public init(count: Int) {
        array = [T?](repeating: nil, count: count)
    }
    
    public mutating func write(_ element: T) -> Bool {
        if !isFull {
            array[writeIndex % array.count] = element
            writeIndex += 1
            return true
        } else {
            return false
        }
    }
    
    public mutating func read() -> T? {
        if !isEmpty {
            let element = array[readIndex % array.count]
            readIndex += 1
            return element
        } else {
            return nil
        }
    }
    
    fileprivate var availableSpaceForReading: Int {
        return writeIndex - readIndex
    }
    
    public var isEmpty: Bool {
        return availableSpaceForReading == 0
    }
    
    fileprivate var availableSpaceForWriting: Int {
        return array.count - availableSpaceForReading
    }
    
    public var isFull: Bool {
        availableSpaceForWriting == 0
    }
    
    public var first: T? {
        if isEmpty {
            return nil
        } else {
            return array[readIndex % array.count]
        }
    }
}

func RingBufferTest() {
    example(of: "RingBuffer") {
        var buffer = RingBuffer<Int>(count: 5)
        print(buffer.write(123))
        print(buffer.write(456))
        print(buffer.write(789))
        print(buffer.write(666))

        print(buffer.read()!)
        print(buffer.read()!)
        print(buffer.read()!)

        print(buffer.write(333))
        print(buffer.write(555))

        print(buffer.read()!)
        print(buffer.read()!)
        print(buffer.read()!)
        print(buffer.read()!)
        
        print(buffer.array)
    }
}
