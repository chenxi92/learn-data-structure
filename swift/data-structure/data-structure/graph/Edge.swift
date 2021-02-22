//
//  Edge.swift
//  data-structure
//
//  Created by peak on 2021/2/22.
//  Copyright © 2021 chenxi. All rights reserved.
//

import Foundation

/// 边
public struct Edge<T> {
    public let source: Vertex<T>
    public let destination: Vertex<T>
    public let weight: Double?
}
