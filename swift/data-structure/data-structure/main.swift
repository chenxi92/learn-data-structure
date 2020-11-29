//
//  main.swift
//  data-structure
//
//  Created by chenxi on 2019/8/13.
//  Copyright © 2019 chenxi. All rights reserved.
//

import Foundation

Bubble.Test()
Selection.Test()
Insertion.Test()
Shell.Test()
Quick.TestRandom()
Quick.TestLomuto()
Quick.TestPartitionLeftRight()
HeapSort.Test()
HeapSort.Test1()
Merge.TestUpToDown()
Merge.TestBottomToUp()
Counting.Test1()
Counting.Test2()
Radix.Test()

var s = Sort()


var bucketArray = [29, 25, 3, 49, 9, 37, 21, 43]
print("\nbucket sort begin: ", bucketArray)
s.bucketSort(&bucketArray, 10)
print("bucket sort end: ", bucketArray)

let sear = Search()
let a1 = [ 0, 1, 1, 3, 3, 3, 3, 6, 8, 10, 11, 11 ]
print("count = ", sear.countOccurrences(of: 2, in: a1))

let sleepArray = [5, 2, 3]
print("sleep sort: ", sleepArray.sleepSorted());


let cache = CacheLRU<Int, String>(capacity: 2)

print(cache.getValue(for: 5) ?? "null")

cache.setValue("One", for: 1)
cache.setValue("Eleven", for: 11)
cache.setValue("Twenty", for: 20)

print(cache.getValue(for: 1) ?? "null" )
print(cache.getValue(for: 11)! )


func testTreeNode() {
    let tree = TreeNode<String>(value: "beverages")
    
    let hotNode = TreeNode<String>(value: "hot")
    let coldNode = TreeNode<String>(value: "cold")
    
    let teaNode = TreeNode<String>(value: "tea")
    let coffeeNode = TreeNode<String>(value: "coffee")
    let chocolateNode = TreeNode<String>(value: "cocoa")
    
    let blackNode = TreeNode<String>(value: "black")
    let greenTeaNode = TreeNode<String>(value: "green")
    let chaiTeaNode = TreeNode<String>(value: "chai")
    
    let sodaNode = TreeNode<String>(value: "soda")
    let milkNode = TreeNode<String>(value: "milk")
    
    let gingerAleNode = TreeNode<String>(value: "ginger ale")
    let bitterLemonNode = TreeNode<String>(value: "bitter lemon")
    
    tree.addChild(hotNode)
    tree.addChild(coldNode)
    
    hotNode.addChild(teaNode)
    hotNode.addChild(coffeeNode)
    hotNode.addChild(chocolateNode)
    
    coldNode.addChild(sodaNode)
    coldNode.addChild(milkNode)
    
    teaNode.addChild(blackNode)
    teaNode.addChild(greenTeaNode)
    teaNode.addChild(chaiTeaNode)
    
    sodaNode.addChild(gingerAleNode)
    sodaNode.addChild(bitterLemonNode)
    
    print(String(describing: tree))
    
    print(String(describing: tree.search("cocoa")))
    print(String(describing: tree.search("bubbly")))
}

testTreeNode()

func testBinarySearchTree() {
    let tree = BinarySearchTree<Int>(array: [7, 2, 5, 10 , 9 ,1])
    
    print(String(describing: tree))
    
    print(tree.count)
    
    print(String(describing: tree.search(2)))
    print(String(describing: tree.searchUseLoop(2)))
    
    print(String(describing: tree.search(21)))
    print(String(describing: tree.searchUseLoop(21)))
    
    tree.traversePreOrder { (value) in
        print(value)
    }
}

testBinarySearchTree()

print(safeEqual("abc", "ab"))


