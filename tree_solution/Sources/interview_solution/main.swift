import Foundation

let node = TreeNode(val: 3, trees: [
    TreeNode(val: 5, trees: [
        TreeNode(val: 6, trees: []),
        TreeNode(val: 2, trees: [
            TreeNode(val: 7, trees: []),
            TreeNode(val: 4, trees: []),
            TreeNode(val: 9, trees: [])
        ]),
        TreeNode(val: 10, trees: [])
    ]),

    TreeNode(val: 1, trees: [
        TreeNode(val: 0, trees: []),
        TreeNode(val: 8, trees: [])
    ])
])

let solution = Solution()

// 답
print(solution.lowestCommonAncestor(root: node, p: 6, q: 9).val)

// 그림으로 표현
let dot = "digraph g {\n" + solution.visualize(root: node) + "}"
let url = URL(fileURLWithPath: "Visualize/node.dot")
try! dot.write(to: url, atomically: false, encoding: .utf8)
