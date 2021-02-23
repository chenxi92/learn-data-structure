//
//  main.swift
//  data-structure
//
//  Created by chenxi on 2019/8/13.
//  Copyright © 2019 chenxi. All rights reserved.
//

import Foundation

func testSort() {
    print("\n------- begin test sorts -------\n")
    Bubble.Test()
    Selection.Test()
    Insertion.Test()
    Shell.Test()
    Quick.TestRandom()
    Quick.TestLomuto()
    Quick.TestHoare()
    Quick.TestPartitionLeftRight()
    HeapSort.Test()
    HeapSort.Test1()
    Merge.TestUpToDown()
    Merge.TestBottomToUp()
    Counting.Test1()
    Counting.Test2()
    Radix.Test()
    Bucket.Test()
    print("\n------- complete test sorts -------\n")
}

testSort()
LinkedListTest()
QueueArrayTest()
QueueRingBufferTest()
QueueStackTest()
TreeNodeTest()
BinaryNodeTest()
BinarySearchTree1Test()
BinarySearchTree2Test()
AVLTreeTest()
TrieTest()
PriorityQueueTest()
TestAdjacencyList()
TestAdjacencyMatrix()
TestBFS()
TestDFS()

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

print(safeEqual("abc", "ab"))


