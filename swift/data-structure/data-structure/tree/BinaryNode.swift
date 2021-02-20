import Foundation

public class BinaryNode<Element> {
    public var value: Element
    public var leftChild: BinaryNode?
    public var rightChild: BinaryNode?
    
    public init(value: Element) {
        self.value = value
    }
}

extension BinaryNode: CustomStringConvertible {
    public var description: String {
        return diagram(for: self)
    }
    
    private func diagram(for node: BinaryNode?,
                         _ top: String = "",
                         _ root: String = "",
                         _ bottom: String = "") -> String {
        guard let node = node else {
            return root + "nil\n"
        }
        if node.leftChild == nil && node.rightChild == nil {
            return root + "\(node.value)\n"
        }
        return diagram(for: node.rightChild, top + " ", top + "┌──", top + "│ ")
                    + root + "\(node.value)\n"
                    + diagram(for: node.leftChild, bottom + "│ ", bottom + "└──", bottom + " ")
    }
}

extension BinaryNode {
    /// 有序遍历
    ///
    /// In-order traversal visit the nodes of a binary tree in the following order, starting from the root node
    /// - If the current node has a left child, recursively visit this child first
    /// - Then visit the node itself
    /// - If the current node has a right child, recursively visit this child
    public func traverseInOrder(visit: (Element) -> Void) {
        leftChild?.traverseInOrder(visit: visit)
        visit(value)
        rightChild?.traverseInOrder(visit: visit)
    }
    
    /// 前置遍历
    ///
    /// Pre-order traversal always visits the current node first, then recursively visit the left and right child
    public func traversePreOrder(visit: (Element) -> Void) {
        visit(value)
        leftChild?.traversePreOrder(visit: visit)
        rightChild?.traversePreOrder(visit: visit)
    }
    
    /// 后置遍历
    ///
    /// Post-order traversal only visits the current node after the left and right child have been visited recursively.
    public func traversePostOrder(visit: (Element) -> Void) {
        leftChild?.traversePostOrder(visit: visit)
        rightChild?.traversePostOrder(visit: visit)
        visit(value)
    }
}

func makeIntTree() -> BinaryNode<Int> {
    let zero = BinaryNode(value: 0)
    let one = BinaryNode(value: 1)
    let five = BinaryNode(value: 5)
    let seven = BinaryNode(value: 7)
    let eight = BinaryNode(value: 8)
    let nine = BinaryNode(value: 9)
    
    seven.leftChild = one
    one.leftChild = zero
    one.rightChild = five
    seven.rightChild = nine
    nine.leftChild = eight
    
    return seven
}


func BinaryNodeTest() {
    example(of: "tree diagram") {
        print(makeIntTree())
    }
    
    example(of: "in-order traversal") {
        let tree = makeIntTree()
        tree.traverseInOrder { print($0) }
    }
    
    example(of: "pre-order traversal") {
        let tree = makeIntTree()
        tree.traversePreOrder { print($0) }
    }
    
    example(of: "pos-order traversal") {
        let tree = makeIntTree()
        tree.traversePostOrder { print($0) }
    }
}
