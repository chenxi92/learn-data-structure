//
//  Vertex.swift
//  data-structure
//
//  Created by peak on 2021/2/22.
//  Copyright © 2021 chenxi. All rights reserved.
//

import Foundation

/// 顶点
public struct Vertex<T> {
    public let index: Int
    public let data: T
}

extension Vertex: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(index.hashValue)
    }
    public static func ==(lhs: Vertex, rhs: Vertex) -> Bool {
        return lhs.index == rhs.index
    }
}

extension Vertex: CustomStringConvertible {
    public var description: String {
        return "\(index): \(data)"
    }
}
