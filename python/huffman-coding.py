# coding: utf-8

string = 'BCAADDDCCACACAC'

class NodeTree(object):

    def __init__(self, left=None, right=None):
        self.left = left
        self.right = right

    def children(self):
        return (self.left, self.right)

    def nodes(self):
        return (self, self.right)

    def __str__(self):
        return "%s_%s" % (self.left, self.right)


def huffman_code_tree(node, left=None, binString=''):
    if type(node) is str:
        return {node: binString}
    (l, r) = node.children()
    d = dict()
    d.update(huffman_code_tree(l, True, binString + '0'))
    d.update(huffman_code_tree(r, False, binString + '1'))
    return d


# Calculating frequency
freq = {}
for c in string:
    if c in freq:
        freq[c] += 1
    else:
        freq[c] = 1
freq = sorted(freq.items(), key=lambda x: x[1], reverse=True)
# freq = [('C', 6), ('A', 5), ('D', 3), ('B', 1)]
nodes = freq

while len(nodes) > 1:
    (key1, c1) = nodes[-1]
    (key2, c2) = nodes[-2]
    nodes = nodes[:-2]
    print nodes
    node = NodeTree(key1, key2)
    nodes.append((node, c1 + c2))
    print nodes
    print ""
    nodes = sorted(nodes, key=lambda x: x[1], reverse=True)

root = nodes[0][0]
print root
print type(root.left)
print type(root.right)

huffmanCode = huffman_code_tree(root)
print huffmanCode

print ' Char | Huffman code '
print '---------------------'
for (char, frequency) in freq
:
    print ' %-4r | %12s' % (char, huffmanCode[char])
