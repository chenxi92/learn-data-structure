# coding: utf-8
import random
import sort
import tool


def test_bubble_sort():
    print "\nbubble sort begin"
    count = random.randint(100, 1000)
    for _ in range(count):
        length = random.randint(5, 30)
        source = tool.random_list(0, 100, length)
        target = sort.bubble_sort(source)
        if tool.list_is_ascend(target) is False:
            print source
            print target
            print ""
            assert(tool.list_is_ascend(target))
    print "bubble sort success in {0} times.\n".format(count)


def test_selection_sort():
    print "\nselection sort begin"
    count = random.randint(100, 1000)
    for _ in range(count):
        length = random.randint(5, 30)
        source = tool.random_list(0, 100, length)
        target = sort.selection_sort(source)
        if tool.list_is_ascend(target) is False:
            print source
            print target
            print ""
            assert(tool.list_is_ascend(target))
    print "selection sort success in {0} times.\n".format(count)


def test_insertion_sort():
    print "\ninsertion sort begin"
    count = random.randint(100, 1000)
    for _ in range(count):
        length = random.randint(5, 30)
        source = tool.random_list(0, 100, length)
        target = sort.insertion_sort(source)
        if tool.list_is_ascend(target) is False:
            print source
            print target
            print ""
            assert(tool.list_is_ascend(target))
    print "insertion sort success in {0} times.\n".format(count)


def test_shell_sort():
    print "\nshell sort begin"
    count = random.randint(100, 1000)
    for _ in range(count):
        length = random.randint(5, 30)
        source = tool.random_list(0, 100, length)
        target = sort.shell_sort(source)
        if tool.list_is_ascend(target) is False:
            print source
            print target
            print ""
            assert(tool.list_is_ascend(target))
    print "shell sort success in {0} times.\n".format(count)


def test_heap_sort():
    print "\nheap sort begin"
    count = random.randint(100, 1000)
    for _ in range(count):
        length = random.randint(5, 30)
        source = tool.random_list(0, 100, length)
        target = sort.heap_sort(source)
        if tool.list_is_descend(target) is False:
            print source
            print target
            print ""
            assert(tool.list_is_descend(target))
    print "heap sort success in {0} times.\n".format(count)


def test_merge_sort_up_bottom():
    print "\nmerge sort up bottom begin"
    count = random.randint(100, 1000)
    for _ in range(count):
        length = random.randint(5, 30)
        source = tool.random_list(0, 100, length)
        target = sort.merge_sort(source)
        if tool.list_is_ascend(target) is False:
            print source
            print target
            print ""
            assert(tool.list_is_ascend(target))
    print "merge sort up bottom success in {0} times.\n".format(count)


def test_merge_sort_bottom_up():
    print "\nmerge sort bottom up begin"
    count = random.randint(100, 1000)
    for _ in range(count):
        length = random.randint(5, 30)
        source = tool.random_list(0, 100, length)
        target = sort.merge_down_to_up(source)
        if tool.list_is_ascend(target) is False:
            print source
            print target
            print ""
            assert(tool.list_is_ascend(target))
    print "merge sort bottom up success in {0} times.\n".format(count)


def test_quick_sort():
    print "\nQuick sort test begin"
    count = random.randint(100, 1000)
    for _ in range(count):
        length = random.randint(5, 30)
        source = tool.random_list(0, 100, length)
        target = sort.quick_sort(source)
        if tool.list_is_ascend(target) is False:
            print source
            print target
            print ""
            assert(tool.list_is_ascend(target))
    print "Quick sort success in {0} times.\n".format(count)


def test_quick_sort_lomuto():
    print "\nQuick sort lomuto test begin"
    count = random.randint(100, 1000)
    for _ in range(count):
        length = random.randint(5, 30)
        source = tool.random_list(0, 100, length)
        target = sort.quick_sort_lomuto(source)
        if tool.list_is_ascend(target) is False:
            print source
            print target
            print ""
            assert(tool.list_is_ascend(target))
    print "Quick sort lomuto success in {0} times.\n".format(count)


def test_counting_sort():
    print "\nCounting sort test begin"
    count = random.randint(100, 1000)
    for _ in range(count):
        length = random.randint(5, 30)
        source = tool.random_list(0, 100, length)
        target = sort.counting_sort(source)
        if tool.list_is_ascend(target) is False:
            print source
            print target
            print ""
            assert(tool.list_is_ascend(target))
    print "Counting sort success in {0} times.\n".format(count)


def test_radix_sort():
    print "\nRadix sort test begin"
    count = random.randint(100, 1000)
    for _ in range(count):
        length = random.randint(5, 30)
        source = tool.random_list(0, 100, length)
        target = sort.radix_sort(source)
        if tool.list_is_ascend(target) is False:
            print source
            print target
            print ""
            assert(tool.list_is_ascend(target))
    print "Radix sort success in {0} times.\n".format(count)


test_bubble_sort()
test_selection_sort()
test_insertion_sort()
test_shell_sort()
test_heap_sort()
test_merge_sort_up_bottom()
test_merge_sort_bottom_up()
test_quick_sort()
test_quick_sort_lomuto()
test_counting_sort()
test_radix_sort()
