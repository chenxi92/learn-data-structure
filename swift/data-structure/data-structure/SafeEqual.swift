//
//  SafeEqual.swift
//  data-structure
//
//  Created by chenxi on 2020/7/9.
//  Copyright © 2020 chenxi. All rights reserved.
//

import Foundation

// Inspire from https://coolshell.cn/articles/21003.html
public func safeEqual(_ a: String, _ b: String) -> Bool {
    if a.count != b.count {
        return false
    }
    
    // Against Timing Attack
    var equal: Int = 0
    for index in a.indices {
        equal |= Int((a[index].asciiValue ?? 0) ^ (b[index].asciiValue ?? 0))
    }
    return equal == 0
}
