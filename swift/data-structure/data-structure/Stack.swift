//
//  Stack.swift
//  Stack
//
//  Created by chenxi on 2019/8/12.
//  Copyright © 2019 karma. All rights reserved.
//

import Foundation

// https://aquarchitect.github.io/swift-algorithm-club/Stack/

public struct Stack<T> {
    fileprivate var array = [T]()
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public mutating func push(_ element: T) {
        array.append(element)
    }
    
    public mutating func pop() -> T? {
        return array.popLast()
    }
    
    public var top: T? {
        return array.last
    }
}

