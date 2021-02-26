# coding: utf-8

# 按照输入字符的行顺序逐列遍历元素
def convert(s, numRows):
    if numRows == 1:
        return s
    rows = []
    curRow = 0
    increase = -1
    for i in range(numRows):
        rows.append("")
    for i in range(len(s)):
        rows[curRow] += s[i]
        if i % (numRows - 1) == 0:
            increase *= -1
        curRow += increase
    return "".join(rows)


# 按照输出字符的行顺序添加元素
# P   | A   | H   | N
# A P | L S | I I | G
# Y   | I   | R   |
# Z型把原始字符串分割为4部分, 每部分元素个数为: cycle = 2 * numRows - 2 = 4
# 当前行i的第1个元素下标为: j = i + cycle * k(k = 0, 1, 2 ...)
# 当前行i的第2个元素下标为: secondj = (j - i) + cycle - i
# (j - i) 当前循环开始的位置
# (j - i) + cycle 下个循环开始的地方
def convertByRow(s, numRows):
    if numRows == 1:
        return s

    ret = ""
    cycleLen = 2 * numRows - 2
    for i in range(numRows):
        j = 0
        while j + i < len(s):
            ret += s[j + i]
            if (i % (numRows - 1) != 0 and j + cycleLen - i < len(s)):
                ret += s[j - i + cycleLen]
            j += cycleLen
    return ret


assert(convert("PAYPALISHIRING", 3) == "PAHNAPLSIIGYIR")
assert(convert("PAYPALISHIRING", 4) == "PINALSIGYAHRPI")
assert(convert("A", 1) == "A")

assert(convertByRow("PAYPALISHIRING", 3) == "PAHNAPLSIIGYIR")
assert(convertByRow("PAYPALISHIRING", 4) == "PINALSIGYAHRPI")
assert(convertByRow("A", 1) == "A")
