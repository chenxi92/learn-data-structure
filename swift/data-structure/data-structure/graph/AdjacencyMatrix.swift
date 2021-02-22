//
//  AdjacencyMatrix.swift
//  data-structure
//
//  Created by peak on 2021/2/22.
//  Copyright © 2021 chenxi. All rights reserved.
//

import Foundation

public class AdjacencyMatrix<T>: Graph {
    public typealias Element = T
    private var vertices: [Vertex<T>] = []
    private var weights: [[Double?]] = []
    public init() {}
    
    public func createVertex(data: T) -> Vertex<T> {
        let vertex = Vertex(index: vertices.count, data: data)
        vertices.append(vertex)
        for i in 0..<weights.count {
            weights[i].append(nil)
        }
        let row = [Double?](repeating: nil, count: vertices.count)
        weights.append(row)
        return vertex
    }
    
    public func addDirectedEdge(from source: Vertex<T>, to destination: Vertex<T>, weight: Double?) {
        weights[source.index][destination.index] = weight
    }
    
    public func edges(from source: Vertex<T>) -> [Edge<T>] {
        var edges: [Edge<T>] = []
        for column in 0..<weights.count {
            if let weight = weights[source.index][column] {
                edges.append(Edge(source: source, destination: vertices[column], weight: weight))
            }
        }
        return edges
    }
    
    public func weight(from source: Vertex<T>, to destination: Vertex<T>) -> Double? {
        return weights[source.index][destination.index]
    }
}

extension AdjacencyMatrix: CustomStringConvertible {
    public var description: String {
        let verticesDescription = vertices.map { "\($0)" }.joined(separator: "\n")
        var grid: [String] = []
        for i in 0..<weights.count {
            var row = ""
            for j in 0..<weights.count {
                if let value = weights[i][j] {
                    row += "\(value)\t"
                } else {
                    row += "ø\t\t"
                }
            }
            grid.append(row)
        }
        let edgesDescription = grid.joined(separator: "\n")
        return "\(verticesDescription)\n\n\(edgesDescription)"
    }
}

func TestAdjacencyMatrix() {
    example(of: "Test adjacency matrix") {
        let graph = AdjacencyMatrix<String>()

        let singapore = graph.createVertex(data: "Singapore")
        let tokyo = graph.createVertex(data: "Tokyo")
        let hongKong = graph.createVertex(data: "Hong Kong")
        let detroit = graph.createVertex(data: "Detroit")
        let sanFrancisco = graph.createVertex(data: "San Francisco")
        let washingtonDC = graph.createVertex(data: "Washington DC")
        let austinTexas = graph.createVertex(data: "Austin Texas")
        let seattle = graph.createVertex(data: "Seattle")

        graph.add(.undirected, from: singapore, to: hongKong, weight: 300)
        graph.add(.undirected, from: singapore, to: tokyo, weight: 500)
        graph.add(.undirected, from: hongKong, to: tokyo, weight: 250)
        graph.add(.undirected, from: tokyo, to: detroit, weight: 450)
        graph.add(.undirected, from: tokyo, to: washingtonDC, weight: 300)
        graph.add(.undirected, from: hongKong, to: sanFrancisco, weight: 600)
        graph.add(.undirected, from: detroit, to: austinTexas, weight: 50)
        graph.add(.undirected, from: austinTexas, to: washingtonDC, weight: 292)
        graph.add(.undirected, from: sanFrancisco, to: washingtonDC, weight: 337)
        graph.add(.undirected, from: washingtonDC, to: seattle, weight: 277)
        graph.add(.undirected, from: sanFrancisco, to: seattle, weight: 218)
        graph.add(.undirected, from: austinTexas, to: sanFrancisco, weight: 297)

        print(graph)
        
        print("San Francisco Outgoing Flights:")
        print("--------------------------------")
        for edge in graph.edges(from: sanFrancisco) {
            print("from: \(edge.source) to: \(edge.destination)")
        }
    }
}
