package main

import "math"

/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func largestValues(root *TreeNode) []int {
	maxValues := []int{}
	traverseTree(root, func(node *TreeNode, level int) {
		for level >= len(maxValues) {
			maxValues = append(maxValues, math.MinInt)
		}
		if node.Val > maxValues[level] {
			maxValues[level] = node.Val
		}
	})
	return maxValues
}

type pair struct {
	node  *TreeNode
	level int
}

func traverseTree(root *TreeNode, callback func(node *TreeNode, level int)) {
	if root == nil {
		return
	}
	queue := make([]pair, 0)
	queue = append(queue, pair{node: root, level: 0})
	for len(queue) > 0 {
		item := queue[0]
		queue = queue[1:]

		callback(item.node, item.level)

		if left := item.node.Left; left != nil {
			queue = append(queue, pair{node: left, level: item.level + 1})
		}

		if right := item.node.Right; right != nil {
			queue = append(queue, pair{node: right, level: item.level + 1})
		}
	}
}
