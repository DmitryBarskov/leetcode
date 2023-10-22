import java.util.*;
import java.util.regex.*;

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode(int x) { val = x; }
 * }
 */
// https://leetcode.com/problems/serialize-and-deserialize-binary-tree/
public class Codec {
    static class TreeNode {
        int val;
        TreeNode left;
        TreeNode right;
        TreeNode(int x) { val = x; }
        TreeNode(int x, TreeNode l, TreeNode r) { val = x; left = l; right = r; }
    }
    static Pattern treePattern = Pattern.compile("\\((-?\\d+) (.*)\\)");

    // Encodes a tree to a single string.
    public static String serialize(TreeNode root) {
        if (root == null) {
          return "()";
        }
        return String.format("(%d %s %s)", root.val, serialize(root.left), serialize(root.right));
    }

    // Decodes your encoded data to tree.
    public static TreeNode deserialize(String data) {
        Matcher matcher = treePattern.matcher(data);
        if (!matcher.find()) {
            return null;
        }
        int val = Integer.parseInt(matcher.group(1));
        TreeNode tree = new TreeNode(val);
        String[] children = splitChildren(matcher.group(2));
        System.out.printf("Node %d has children %s\n", val, String.join(" and ", children));
        tree.left = deserialize(children[0]);
        tree.right = deserialize(children[1]);
        return tree;
    }

    static String[] splitChildren(String children) {
        int depth = 0;
        for (int i = 0; i < children.length(); i++) {
            if (children.charAt(i) == '(') {
                depth += 1;
            } else if (children.charAt(i) == ')') {
                depth -= 1;
            }
            if (depth == 0) {
                return new String[] {
                    children.substring(0, i + 1),
                    children.substring(i + 1).trim()
                };
            }
        }
        throw new IllegalArgumentException("Children is not in format '(.*) (.*)', " + children);
    }
}
