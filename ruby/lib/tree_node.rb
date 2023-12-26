# frozen_string_literal: true

class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end

  def self.from_array(array)
    return nil if array.empty?

    root = TreeNode.new(array[0])
    previous_row = [root]

    i = 1
    while i < array.size
      current_row = []
      previous_row.each do |node|
        unless array[i].nil?
          node.left = TreeNode.new(array[i])
          current_row << node.left
        end
        i += 1
        break if i >= array.size

        unless array[i].nil?
          node.right = TreeNode.new(array[i])
          current_row << node.right
        end
        i += 1
        break if i >= array.size
      end
      previous_row = current_row
    end

    root
  end

  def self.[](*array)
    from_array(array)
  end

  def to_a
    queue = [self]
    arr = []

    until queue.empty?
      current_node = queue.shift
      arr << current_node&.val

      if current_node
        queue.push(current_node.left)
        queue.push(current_node.right)
      end
    end

    arr.reverse.drop_while(&:nil?).reverse
  end
  alias_method :deconstruct, :to_a

  def to_s(indent: "")
    <<~TEXT.strip
      #{indent}(#{val}
      #{indent}  #{left&.to_s(indent: "#{indent}  ") || "nil"}
      #{indent}  #{right&.to_s(indent: "#{indent}  ") || "nil"})
    TEXT
  end

  def inspect(indent: "")
    <<~TEXT.strip
      #{indent}#<TreeNode @val=#{val}
      #{indent}  @left =#{left&.inspect(indent: "#{indent}  ") || "nil"}
      #{indent}  @right=#{right&.inspect(indent: "#{indent}  ") || "nil"}>
    TEXT
  end
end
