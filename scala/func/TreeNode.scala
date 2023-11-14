package func

import scala.collection.mutable.ArrayBuffer
import scala.util.control.Breaks.{break, breakable}

class TreeNode(_value: Int = 0, _left: TreeNode = null, _right: TreeNode = null) {
  var value: Int = _value
  var left: TreeNode = _left
  var right: TreeNode = _right
}


object TreeNode {
  def from(arrayWithNulls: Any*): TreeNode = {
    if (arrayWithNulls.isEmpty) {
      return null
    }

    val array = arrayWithNulls.map(value => if (value == null) {
      None
    } else {
      Some(value.asInstanceOf[Int])
    }).toList

    val root = new TreeNode(array.head.get)

    var previousRow = ArrayBuffer[TreeNode](root)
    var i = 1

    breakable {
      while (i < array.size) {
        val currentRow = ArrayBuffer[TreeNode]()
        for (node <- previousRow) {
          if (array(i).isDefined) {
            node.left = new TreeNode(array(i).get)
            currentRow.append(node.left)
          }
          i += 1
          if (i >= array.size) {
            break
          }
          if (array(i).isDefined) {
            node.right = new TreeNode(array(i).get)
            currentRow.append(node.right)
          }
          i += 1
        }
        previousRow = currentRow
      }
    }

    root
  }
}
