

> 队列(Queue) 是一种先入先出(FIFO)的数据结构。



### 实现方式

#### 基于数组的实现方式

```swift
public struct QueueArray<T> {
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
```



#### 基于栈的实现方式

入栈元素放在右侧栈中，出栈元素放在左侧栈中

```swift
public struct QueueStack<T>  {
    private var leftStack: [T] = []
    private var rightStack: [T] = []
    public init() {}
    
    public mutating func enqueue(_ element: T) -> Bool {
        rightStack.append(element)
        return true
    }
    
    public mutating func dequeue() -> T? {
        if leftStack.isEmpty {
          	/// 坐侧栈内为空的时候，转移右侧栈内元素到左侧栈内
            leftStack = rightStack.reversed()
            rightStack.removeAll()
        }
        return leftStack.popLast()
    }
    
    public var isEmpty: Bool {
        return leftStack.isEmpty && rightStack.isEmpty
    }
    
    public var peek: T? {
        /// 左侧栈内有元素取最后一个， 否则取右侧栈内第一个元素
        return !leftStack.isEmpty ? leftStack.last : rightStack.first
    }
}
```



#### 基于环形缓冲区的实现方式

 ```swift
public struct RingBuffer<T> { 
    fileprivate var array: [T?]
  	/// 读指针位置
    fileprivate var readIndex = 0
  	/// 写指针位置
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


public struct QueueRingBuffer<T> {
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
 ```





