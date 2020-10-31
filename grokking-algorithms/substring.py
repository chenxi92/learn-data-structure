#coding: utf-8

def string_to_list(str):
    arr = []
    for i in str:
        arr.append(i)
    return arr

# 找最长子串
def find_longest_common_substring(first, second):
    first_arr = string_to_list(first)
    second_arr = string_to_list(second)
    grid = []
    length = 0
    for i in range(0, len(first_arr)):
        grid.append([])
        for j in range(0, len(second_arr)):
            grid[i].append(0)
            if first_arr[i] == second_arr[j]:
                # 两个字母相同，值为左上方单元格的值加1
                # print i, j, first_arr[i]
                if (i < 1 or j < 1):
                    grid[i][j] = 1
                else:
                    grid[i][j] = grid[i - 1][j - 1] + 1
                length = grid[i][j]
            else:
                # 两个字母不相同，值为0
                grid[i][j] = 0
    for arr in grid:
        print arr
    return length

# 找最长子序列
def find_longest_common_subsequence(first, second):
    first_arr = string_to_list(first)
    second_arr = string_to_list(second)
    gird = []
    length = 0
    for i in range(0, len(first_arr)):
        gird.append([])
        for j in range(0, len(second_arr)):
            gird[i].append(0)
            # 同样位置字符串相同
            if i == j and first_arr[i] == second_arr[j]:
                # 两个字母相同，值为左上方单元格的值加1
                # print i, j, first_arr[i]
                if (j < 1 or j < 1):
                    gird[i][j] = 1
                else:
                    gird[i][j] = gird[i - 1][j - 1] + 1
            else:
                # 如果两个字母不同，就选择上方和左方邻居中较大的那个
                if i < 1 and j < 1:
                    gird[i][j] = 0
                elif i < 1 and j >= 1:
                    gird[i][j] = gird[i][j-1]
                elif j < 1 and i >= 1:
                    gird[i][j] = gird[i-1][j]
                else:
                    gird[i][j] = max(gird[i - 1][j], gird[i][j - 1])
    for arr in gird:
        print arr
    length = gird[len(first_arr) - 1][len(second_arr) - 1]
    return length

def test_substring():
    first = "fosh"
    second = "fort"
    print "longest common substring in [{}] and [{}] is {}".format(first, second, find_longest_common_substring(first, second))

    first = "fosh"
    second = "fish"
    print "longest common substring in [{}] and [{}] is {}".format(first, second, find_longest_common_substring(first, second))

    first = "fosh"
    second = "peak"
    print "longest common substring in [{}] and [{}] is {}".format(first, second, find_longest_common_substring(first, second))

    first = "peakh"
    second = "fish"
    print "longest common substring in [{}] and [{}] is {}".format(first, second, find_longest_common_substring(first, second))

def test_subsequence():
    first = "fosh"
    second = "fort"
    print "logest common subsequence in [{}] and [{}] is {}".format(first, second, find_longest_common_subsequence(first, second))

    first = "fosh"
    second = "fish"
    print "logest common subsequence in [{}] and [{}] is {}".format(first, second, find_longest_common_subsequence(first, second))

    first = "fosh"
    second = "peah"
    print "logest common subsequence in [{}] and [{}] is {}".format(first, second, find_longest_common_subsequence(first, second))

    first = "fosh"
    second = "peakh"
    print "logest common subsequence in [{}] and [{}] is {}".format(first, second, find_longest_common_subsequence(first, second))

test_substring()
print '\n-----\n'
test_subsequence()

