# coding: utf-8


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


assert(convert("PAYPALISHIRING", 3) == "PAHNAPLSIIGYIR")
assert(convert("PAYPALISHIRING", 4) == "PINALSIGYAHRPI")
assert(convert("A", 1) == "A")
