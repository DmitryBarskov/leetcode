import java.util.ArrayList;

public class TreeNode {
    public int val;
    public TreeNode left;
    public TreeNode right;
    public TreeNode() {}
    public TreeNode(int val) { this.val = val; }
    public TreeNode(int val, TreeNode left, TreeNode right) {
        this.val = val;
        this.left = left;
        this.right = right;
    }

    public static TreeNode fromArray(Integer[] array) {
        if (array.length == 0 || array[0] == null) {
            return null;
        }

        var root = new TreeNode(array[0]);
        var previousRow = new ArrayList<TreeNode>();
        previousRow.add(root);

        int i = 1;
        while (i < array.length) {
            var currentRow = new ArrayList<TreeNode>();
            for (var node : previousRow) {
                if (array[i] != null) {
                    node.left = new TreeNode(array[i]);
                    currentRow.add(node.left);
                }
                i += 1;
                if (i >= array.length) {
                    break;
                }

                if (array[i] != null) {
                    node.right = new TreeNode(array[i]);
                    currentRow.add(node.right);
                }

                i += 1;
                if (i >= array.length) {
                    break;
                }
            }
            previousRow = currentRow;
        }

        return root;
    }
}
