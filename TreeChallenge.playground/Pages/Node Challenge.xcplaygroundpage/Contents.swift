import UIKit

// Start of Node class
class Node {
    var data: Int
    var left: Node?
    var right: Node?

    init(d : Int) {
        data  = d
    }
} // End of Node class

// Start of Tree class
class Tree {
    func insert(root: Node?, data: Int) -> Node? {
        if root == nil {
            return Node(d: data)
        }

        if data <= (root?.data)! {
            root?.left = insert(root: root?.left, data: data)
        } else {
            root?.right = insert(root: root?.right, data: data)
        }

        return root
    }

    func getHeight(root: Node?) -> Int {
        var rightValue: Int = 0
        var leftValue: Int = 0
        if let node = root {
            if let rightNode = node.right {
                rightValue = self.getHeight(root: rightNode) + 1
            } else if let leftNode = node.left {
                leftValue = self.getHeight(root: leftNode) + 1
            } else {
                return 0
            }
            if let leftNode = node.left, leftValue == 0 {
                leftValue = self.getHeight(root: leftNode) + 1
            }
            
            if rightValue > leftValue {
                return rightValue
            } else {
                return leftValue
            }
        } else {
            return 0
        }
    }


} // End of Tree class

var root: Node?
let tree = Tree()



for i in [1, 3, 2, 5, 4, 6, 7, 9, 8, 11, 13, 12, 10, 15, 14] {
    root = tree.insert(root: root, data: i)
}

print(tree.getHeight(root: root))

