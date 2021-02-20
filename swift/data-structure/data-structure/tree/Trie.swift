//
//  Trie.swift
//  data-structure
//
//  Created by peak on 2021/2/20.
//  Copyright © 2021 chenxi. All rights reserved.
//

import Foundation

public class Trie<CollectionType: Collection> where CollectionType.Element: Hashable {
    
    public typealias Node = TrieNode<CollectionType.Element>
    
    private let root = Node(key: nil, parent: nil)
    
    public init() { }
}

extension Trie {
    public func insert(_ collection: CollectionType) {
        var current = root
        for element in collection {
            if current.children[element] == nil {
                current.children[element] = Node(key: element, parent: current)
            }
            current = current.children[element]!
        }
        current.isTerminating = true
    }
    
    public func contains(_ collection: CollectionType) -> Bool {
        var current = root
        for element in collection {
            guard let child = current.children[element] else {
                return false
            }
            current = child
        }
        return current.isTerminating
    }
    
    public func remove(_ collection: CollectionType) {
        /// 判断 trie 中是否包含 collection
        /// 把 curren 指向 collection 中最后一个点
        var current = root
        for element in collection {
            guard let child = current.children[element] else {
                return
            }
            current = child
        }
        
        guard current.isTerminating else {
            return
        }
        /// 设置终止标识符，确保下面步骤可以移除
        current.isTerminating = false
        
        /// 避免删除共享数据, 确保删除的节点是终止节点
        /// 从最后一个节点依次往上删除
        while let parent = current.parent, current.children.isEmpty && !current.isTerminating {
            parent.children[current.key!] = nil
            current = parent
        }
    }
}

public extension Trie where CollectionType: RangeReplaceableCollection {
    func collections(startingWith prefix: CollectionType) -> [CollectionType] {
        var current = root
        for element in prefix {
            guard let child = current.children[element] else {
                return []
            }
            /// curren 指向 prefix 的末尾位置
            current = child
        }
        /// 递归检查 curren 之后的节点
        return collections(startingWith: prefix, after: current)
    }
    
    private func collections(startingWith prefix: CollectionType, after node: Node) -> [CollectionType] {
        var result: [CollectionType] = []
        
        /// curren 如果是 terminal 节点， 添加进入结果集中
        if node.isTerminating {
            result.append(prefix)
        }
        
        /// 遍历 curren 子节点
        for child in node.children.values {
            /// 更新 prefix
            var newPrefix = prefix
            newPrefix.append(child.key!)
            
            /// 递归调用，检查子节点是否符合 更新后的 prefix
            result.append(contentsOf: collections(startingWith: newPrefix, after: child))
        }
        return result
    }
}


func TrieTest() {
    example(of: "Trie insert and contains") {
        let trie = Trie<String>()
        trie.insert("cute")
        if trie.contains("cute") {
            print("cute is in the trie")
        }
    }
    
    example(of: "remove") {
        let trie = Trie<String>()
        trie.insert("cut")
        trie.insert("cute")

        print("\n*** Before removing ***")
        assert(trie.contains("cut"))
        print("\"cut\" is in the trie")
        assert(trie.contains("cute"))
        print("\"cute\" is in the trie")
        
        print("\n*** After removing cut ***")
        trie.remove("cut")
        assert(!trie.contains("cut"))
        assert(trie.contains("cute"))
        print("\"cute\" is still in the trie")
        
    }

    example(of: "prefix matching") {
        let trie = Trie<String>()
        trie.insert("car")
        trie.insert("card")
        trie.insert("care")
        trie.insert("cared")
        trie.insert("cars")
        trie.insert("carbs")
        trie.insert("carapace")
        trie.insert("cargo")

        print("\nCollections starting with \"car\"")
        let prefixedWithCar = trie.collections(startingWith: "car")
        print(prefixedWithCar)

        print("\nCollections starting with \"care\"")
        let prefixedWithCare = trie.collections(startingWith: "care")
        print(prefixedWithCare)
    }

}
