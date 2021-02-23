//
//  BreadthFirstSearch.swift
//  data-structure
//
//  Created by peak on 2021/2/23.
//  Copyright © 2021 chenxi. All rights reserved.
//

import Foundation

extension Graph {
    
    func breadthFirstSearch(from source: Vertex<Element>) -> [Vertex<Element>] {
        /// 记录相邻的顶点
        var queue = QueueStack<Vertex<Element>>()
        /// 记录已经加入过的 顶点
        var enqueued: Set<Vertex<Element>> = []
        /// 记录已经遍历过的顶点
        var visited: [Vertex<Element>] = []
        
        queue.enqueue(source)
        enqueued.insert(source)
        
        while let vertex = queue.dequeue() {
            visited.append(vertex)
            /// 查找相邻顶点
            let neighborEdges = edges(from: vertex)
            neighborEdges.forEach { edge in
                if !enqueued.contains(edge.destination) {
                    queue.enqueue(edge.destination)
                    enqueued.insert(edge.destination)
                }
            }
        }
        return visited
    }
}


func TestBFS() {
    example(of: "test breadth first search") {
        let graph = AdjacencyMatrix<String>()
        
        let a = graph.createVertex(data: "A")
        let b = graph.createVertex(data: "B")
        let c = graph.createVertex(data: "C")
        let d = graph.createVertex(data: "D")
        let e = graph.createVertex(data: "E")
        let f = graph.createVertex(data: "F")
        let g = graph.createVertex(data: "G")
        let h = graph.createVertex(data: "H")
        
        graph.addDirectedEdge(from: a, to: b, weight: 0)
        graph.addDirectedEdge(from: a, to: c, weight: 0)
        graph.addDirectedEdge(from: a, to: d, weight: 0)
        graph.addDirectedEdge(from: b, to: e, weight: 0)
        graph.addDirectedEdge(from: c, to: f, weight: 0)
        graph.addDirectedEdge(from: c, to: g, weight: 0)
        graph.addDirectedEdge(from: f, to: g, weight: 0)
        graph.addDirectedEdge(from: e, to: f, weight: 0)
        graph.addDirectedEdge(from: e, to: h, weight: 0)
        
        let vertices = graph.breadthFirstSearch(from: a)
        vertices.forEach { vertex in
            print(vertex)
        }
    }
}
