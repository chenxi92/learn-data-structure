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
    public init() {}
    
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
    
    public func peak() -> T? {
        return array.last
    }
}

extension Stack: CustomStringConvertible {
    public var description: String {
        let topDivider = "----top----\n"
        let bottomDivider = "\n-----------"
        let stackElements = array
            .map { "\($0)" }
            .reversed()
            .joined(separator: "\n")
        return topDivider + stackElements + bottomDivider
    }
}

