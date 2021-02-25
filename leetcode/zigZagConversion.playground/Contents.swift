import Foundation

/**
 Z字转换
 字符串 PAYPALISHIRING 按照Z字类型，分3行排列
 A   H   N
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

