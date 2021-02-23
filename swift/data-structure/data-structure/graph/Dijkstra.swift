//
//  Dijkstra.swift
//  data-structure
//
//  Created by peak on 2021/2/23.
//  Copyright © 2021 chenxi. All rights reserved.
//

import Foundation

public enum Visit<T: Hashable> {
    case start
    case edge(Edge<T>)
}

public class Dijkstra<T: Hashable> {
    public typealias Graph = AdjacencyList<T>
    let graph: Graph
    
    public init(graph: Graph) {
        self.graph = graph
    }
    
    public func shortestPath(from start: Vertex<T>, to destination: Vertex<T>) -> [Edge<T>] {
        let pathFromStart = shortestPath(from: start)
        return route(to: destination, with: pathFromStart)
    }
    
    /// 经过start点可以到达的其他的所有顶点以及边的集合
    /// - Parameter start: 起点
    /// - Returns: [顶点： 边]
    private func shortestPath(from start: Vertex<T>) -> [Vertex<T> : Visit<T>] {
        var paths : [Vertex<T> : Visit<T>] = [start: Visit.start]
        
        /// 最小优先级队列，存储所有已经遍历过的顶点
        var priorityQueue = PriorityQueue<Vertex<T>>( sort: {
            self.distance(to: $0, with: paths) < self.distance(to: $1, with: paths)
        })
        _ = priorityQueue.enqueue(start)
        
        while let vertex = priorityQueue.dequeue() {
            for edge in self.graph.edges(from: vertex) {
                guard let weight = edge.weight else {
                    continue
                }
                if paths[edge.destination] == nil ||
                    distance(to: vertex, with: paths) + weight < distance(to: edge.destination, with: paths) {
                    paths[edge.destination] = Visit.edge(edge)
                    _ = priorityQueue.enqueue(edge.destination)
                }
            }
        }
        
        return paths
    }
    
    private func route(to destination: Vertex<T>, with paths: [Vertex<T>: Visit<T>]) -> [Edge<T>] {
        var vertex = destination
        var path: [Edge<T>] = []
        
        while let visit = paths[vertex], case .edge(let edge) = visit {
            path.insert(edge, at: 0)
            vertex = edge.source
        }
        return path
    }
    
    private func distance(to destination: Vertex<T>, with paths: [Vertex<T> : Visit<T>]) -> Double {
        /// 计算到达destination顶点的所有路径
        let path = route(to: destination, with: paths)
        /// 移除nil
        let distance = path.compactMap { $0.weight }
        /// 累加
        return distance.reduce(0.0, +)
    }
}


func TestDijkstraAlgorithm() {
    example(of: "Dijkstra algorithm") {
        let graph = AdjacencyList<String>()
        let a = graph.createVertex(data: "A")
        let b = graph.createVertex(data: "B")
        let c = graph.createVertex(data: "C")
        let d = graph.createVertex(data: "D")
        let e = graph.createVertex(data: "E")
        let f = graph.createVertex(data: "F")
        let g = graph.createVertex(data: "G")
        let h = graph.createVertex(data: "H")
        
        graph.addDirectedEdge(from: a, to: b, weight: 8)
        graph.addDirectedEdge(from: a, to: g, weight: 1)
        graph.addDirectedEdge(from: a, to: f, weight: 9)
        
        graph.addDirectedEdge(from: g, to: c, weight: 3)
        
        graph.addDirectedEdge(from: c, to: b, weight: 3)
        graph.addDirectedEdge(from: c, to: e, weight: 1)
        graph.addDirectedEdge(from: e, to: c, weight: 8)
        
        graph.addDirectedEdge(from: e, to: b, weight: 1)
        graph.addDirectedEdge(from: e, to: d, weight: 2)
        
        graph.addDirectedEdge(from: b, to: e, weight: 1)
        
        graph.addDirectedEdge(from: b, to: f, weight: 3)
        graph.addDirectedEdge(from: f, to: a, weight: 2)
        
        graph.addDirectedEdge(from: h, to: f, weight: 2)
        graph.addDirectedEdge(from: h, to: g, weight: 5)
        
        let dijkstra = Dijkstra(graph: graph)
        let path = dijkstra.shortestPath(from: a, to: b)
        for edge in path {
            print("\(edge.source.data) --|\(edge.weight ?? 0.0)|--> \(edge.destination.data)")
        }
    }
}
