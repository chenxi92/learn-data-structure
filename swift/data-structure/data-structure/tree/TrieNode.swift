//
//  TrieNode.swift
//  data-structure
//
//  Created by peak on 2021/2/20.
//  Copyright © 2021 chenxi. All rights reserved.
//

import Foundation

public class TrieNode<Key: Hashable> {
    public var key: Key?
    public weak var parent: TrieNode?
    public var children: [Key: TrieNode] = [:]
    public var isTerminating = false
    
    public init(key: Key?, parent: TrieNode?) {
        self.key = key
        self.parent = parent
    }
}

