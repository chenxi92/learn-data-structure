import Foundation

/**
 Z字转换
 字符串 PAYPALISHIRING 按照Z字类型，分3行排列
 P   A   H   N
 A P L S I I G
 Y   I   R
 之后逐行读取字符串，输出 PAHNAPLSIIGYIR
 */

/// 按照字符串的顺序，逐行排序
func convert(_ s: String, _ numRows: Int) -> String {
    guard numRows > 1 else {
        return s
    }
    let charArray = Array(s)
    var rows = Array(repeating: "", count: numRows)
    var curRow = 0
    /// 控制读取行的方向（向下/向上）到达第一行后需要向下读取，到达最后一行之后接下来需要往上读取
    var increase = -1
    for i in 0..<charArray.count {
        if i % (numRows - 1) == 0 {
            increase *= -1
        }
        /// 同一行的字符，添加到数组中的同一个元素中
        rows[curRow] += String(charArray[i])
        curRow += increase
    }
    return rows.joined()
}

assert(convert("PAYPALISHIRING", 3) == "PAHNAPLSIIGYIR")
assert(convert("PAYPALISHIRING", 4) == "PINALSIGYAHRPI")
assert(convert("A", 1) == "A")

/**
 按照输出字符的行顺序添加元素
P   | A   | H   | N
A P | L S | I I | G
Y   | I   | R   |
Z型把原始字符串分割为4部分, 每部分元素个数为: cycle = 2 * numRows - 2 = 4
当前行i的第1个元素下标为: j = i + cycle * k(k = 0, 1, 2 ...)
当前行i的第2个元素下标为: secondj = (j - i) + cycle - i
(j - i) 当前循环开始的位置
(j - i) + cycle 下个循环开始的地方
 
 /*n=numRows
 Δ=2n-2    1                           2n-1                         4n-3
 Δ=        2                     2n-2  2n                    4n-4   4n-2
 Δ=        3               2n-3        2n+1              4n-5       .
 Δ=        .           .               .               .            .
 Δ=        .       n+2                 .           3n               .
 Δ=        n-1 n+1                     3n-3    3n-1                 5n-5
 Δ=2n-2    n                           3n-2                         5n-4
 */
*/
func convertByRow(_ s: String, _ numRows: Int) -> String {
    guard numRows > 1 else {
        return s
    }
    
    let charArray = Array(s)
    var ret = ""
    let cycleLen = 2 * numRows - 2
    for i in 0..<numRows {
        var j = 0
        while j + i < charArray.count{
            ret += String(charArray[j + i])
            if i % (numRows - 1) != 0 && (j + cycleLen - i < charArray.count){
                ret += String(charArray[j - i + cycleLen])
            }
            j += cycleLen
        }
    }
    return ret
}

assert(convertByRow("PAYPALISHIRING", 3) == "PAHNAPLSIIGYIR")
assert(convertByRow("PAYPALISHIRING", 4) == "PINALSIGYAHRPI")
assert(convertByRow("A", 1) == "A")
