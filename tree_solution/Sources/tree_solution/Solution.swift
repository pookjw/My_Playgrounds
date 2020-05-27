import Foundation

typealias TreeNode = Solution.TreeNode

public class Solution {
    struct TreeNode {
        var val: Int
        var trees: [TreeNode]
    }

    func lowestCommonAncestor(root: TreeNode, p: Int, q: Int) -> TreeNode {

        // TreeNode를 분석해서 p와 q값의 위치(map)를 찾아내고 없을 경우 false
        let (p_map, p_result) = self.searchValue(root: root, value: p)
        let (q_map, q_result) = self.searchValue(root: root, value: q)

        // 값이 없을 경우 종료
        if !p_result || !q_result {
            print(p_result)
            fatalError("Can't Find a value in root!")
        }

        // parent tree의 위치를 얻음
        let common_map = self.getCommonMap(p: p_map, q: q_map)

        // parent tree 위치를 TreeNode로 return
        return getTreeNode(root: root, map: common_map)
    }

    private func searchValue(root: TreeNode, value: Int, map: [Int] = []) -> ([Int], Bool) {
        for tmp in root.trees {
            if tmp.val == value, let idx = root.trees.firstIndex(of: tmp) {
                return (map + [idx], true)
            }
        }

        for tmp in 0..<root.trees.count {
            let result = self.searchValue(root: root.trees[tmp], value: value, map: map + [tmp])
            if result.1 == true {
                return result
            }
        }

        return (map, false)
    }

    private func getCommonMap(p: [Int], q: [Int]) -> [Int] {
        var result: [Int] = []
        let min_length: Int = (p.count > q.count) ? q.count : p.count

        for tmp in 0..<min_length {
            if p[tmp] == q[tmp] {
                result.append(p[tmp])
            }
        }

        return result
    }

    private func getTreeNode(root: TreeNode, map: [Int]) -> TreeNode {
        var result = root

        for tmp in map {
            result = result.trees[tmp]
        }

        return result
    }

    private var idx = 0
    func visualize(
        root: TreeNode,
        str: String = "",
        parent_idx: Int = 0
    ) -> String {

        var str = str
        var parent_idx = parent_idx

        if self.idx == 0 {
            str += "    0 [label=\"\(String(root.val))\"];\n"
        } else {
            str += "    \(String(self.idx)) [label=\"\(String(root.val))\"];\n"
            str += "    \(String(parent_idx)) -> \(String(self.idx));\n"
            parent_idx = self.idx
        }

        for tmp in root.trees {
            self.idx += 1
            str = self.visualize(root: tmp, str: str, parent_idx: parent_idx)
        }

        return str
    }
}

extension TreeNode: Equatable {
    static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        return lhs.val == rhs.val && lhs.trees == rhs.trees
    }
}
