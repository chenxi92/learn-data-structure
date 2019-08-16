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
