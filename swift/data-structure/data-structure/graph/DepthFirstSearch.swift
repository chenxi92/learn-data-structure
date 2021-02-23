//
//  DepthFirstSearch.swift
//  data-structure
//
//  Created by peak on 2021/2/23.
//  Copyright © 2021 chenxi. All rights reserved.
//

import Foundation

extension Graph {
    func depthFirstSearch(from source: Vertex<Element>)
          -> [Vertex<Element>] {
        var stack = Stack<Vertex<Element>>()
        var pushed: Set<Vertex<Element>> = []
        var visited: [Vertex<Element>] = []
        
        stack.push(source)
        pushed.insert(source)
        visited.append(source)
        
        outer: while let vertex = stack.peak() {
            let neighbors = edges(from: vertex)
            guard !neighbors.isEmpty else {
                // 相邻节点不存在， 查看上一个分支
                _ = stack.pop()
                continue
            }
            for edge in neighbors {
                if !pushed.contains(edge.destination) {
                    stack.push(edge.destination)
                    pushed.insert(edge.destination)
                    visited.append(edge.destination)
                    continue outer // 5 进入相邻节点的下一级
                }
            }
            _ = stack.pop() // 6 相邻节点遍历完毕， 弹出该节点
        }
        return visited
    }
}

func TestDFS() {
    example(of: "test depth first search") {
        let graph = AdjacencyList<String>()
        
        let a = graph.createVertex(data: "A")
        let b = graph.createVertex(data: "B")
        let c = graph.createVertex(data: "C")
        let d = graph.createVertex(data: "D")
        let e = graph.createVertex(data: "E")
        let f = graph.createVertex(data: "F")
        let g = graph.createVertex(data: "G")
        let h = graph.createVertex(data: "H")
        
        graph.addUndirectedEdge(between: a, and: b, weight: 0)
        graph.addUndirectedEdge(between: b, and: e, weight: 0)
        graph.addUndirectedEdge(between: e, and: f, weight: 0)
        graph.addUndirectedEdge(between: e, and: h, weight: 0)
        graph.addUndirectedEdge(between: f, and: g, weight: 0)
        graph.addUndirectedEdge(between: f, and: c, weight: 0)
        graph.addUndirectedEdge(between: g, and: c, weight: 0)
        graph.addUndirectedEdge(between: a, and: c, weight: 0)
        graph.addUndirectedEdge(between: a, and: d, weight: 0)

        let vertices = graph.depthFirstSearch(from: a)
        vertices.forEach { vertex in
            print(vertex)
        }
    }
}
