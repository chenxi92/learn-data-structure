//
//  SleepSort.swift
//  data-structure
//
//  Created by chenxi on 2020/6/22.
//  Copyright © 2020 chenxi. All rights reserved.
//

import Foundation

// https://sarunw.com/posts/sleep-sort-sorting-algorithm-without-compare

extension Array where Element == Int {
    func sleepSorted() -> [Element] {
        var sortedElements = [Element]()
        
        let group = DispatchGroup()
        
        for element in self {
            group.enter()
            DispatchQueue.global().async {
                let ms = 1000
                // usleep use millsecond interval
                // 1 second equals 1000 millseconds
                // 1 millsecond equals 1000 microseconds
                usleep(useconds_t(element * ms))
                sortedElements.append(element)
                group.leave()
            }
        }
        
        group.wait()
        return sortedElements
    }
}
