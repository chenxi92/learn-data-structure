//
//  main.swift
//  data-structure
//
//  Created by chenxi on 2019/8/13.
//  Copyright © 2019 chenxi. All rights reserved.
//

import Foundation

class Person {
    var name: String
    var age: Int
    
    init(_ name: String, _ age: Int) {
        self.name = name
        self.age = age
    }
}


var s = Sort()

let numbers = [ 10, -1, 3, 9, 2, 27, 8, 5, 1, 3, 0, 26 ]

let a = s.insertionSort2(numbers)
print("after sort: ", a)

let b = s.insertionSort(numbers, <)
print("after < sort: ", b)

let c = s.insertionSort(numbers, >)
print("after > sort: ", c)

let p1 = Person("chenxi1", 11)
let p2 = Person("chenxi2", 14)
let p3 = Person("chenxi3", 11)
let p4 = Person("chenxi4", 15)
let persons = [p1, p2, p3, p4]
let d = s.insertionSort(persons) {(p1: Person, p2: Person) in
    if p1.age < p2.age {
        return p1.age < p2.age
    } else {
        return p1.name < p1.name
    }
}

for p in d {
    print(p.name, p.age)
}


print("\nbegin test merge sort:")
let mergeNumbers = [1, 7, 8, 3, 6, 9]
print("top-down begin merge: ", mergeNumbers)
print("top-down after merge: ", s.mergeSortTopDown(mergeNumbers))

let array = [4, 2, 1, 5, 7, 6, 3]
print("bottom-up begin merge: ", array)
print("bottom-up after merge: ", s.mergeSortBottomUp(array, <))


let countArray = [10, 9, 8, 7, 1, 2, 7, 3]
var result = s.countingSort(countArray)
print("\ncounting sort begin: ", countArray)
print("counting sort end: ", result)

var bubbleArrtay = [5, 1, 4, 2, 8]
result = s.bubbleSort(array: &bubbleArrtay, >)
print("\nbubble sort begin: ", bubbleArrtay)
print("bubble sort end: ", result)

var selectionArray = [ 10, -1, 3, 9, 2, 27, 8, 5, 1, 3, 0, 26 ]
result = s.selectionSort(array: &selectionArray, <)
print("\nselection sort begin: ", selectionArray)
print("selection sort end: ", result)

var shellArray = [22, 7, 2, -5, 8, 4, 7]
print("\nshell sort begin: ", shellArray)
s.shellsort(seq: &shellArray, >)
print("shell sort end: ", shellArray)


var arr = [64, 20, 50, 33, 72, 10, 23, -1, 4, 5, 33]
print("\nshell sort begin: ", arr)
s.shellsort(seq: &arr, >)
print("shell sort end", arr)

var quickArray = [ 10, 0, 3, 9, 2, 14, 26, 27, 1, 5, 8, -1, 8 ]
print("\nquick sort begin: ", quickArray)
s.quicksortLomuto(&quickArray, low: 0, high: quickArray.count - 1)
print("quick sort end: ", quickArray)

quickArray = [9, 8, 7, 6, 5, 4, 3, 2, 1, 1, 0]
print("\nquick sort begin: ", quickArray)
result = s.quickSort(quickArray, true)
print("quick sort end: ", result)


var heapArray = [-1, 5, 2, 6, 0, 3, 9 ,1, 7, 4]
//heapArray = [4, 1, 3, 2, 16, 9,9, 10, 14, 8, 7]
print("\nheap sort begin: ", heapArray)
s.heapSort(&heapArray, <)
print("heap sort end: ", heapArray)

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
