class List
  Node = Struct.new(:pred, :val, :succ)

  def initialize
    @head_ref = Node.new(nil, :head, nil)
    @tail_ref = Node.new(@head_ref, :tail, nil)
    @head_ref.succ = @tail_ref
  end

  def prepend(val) = insert_after(@head_ref, val:)
  def append(val) = insert_before(@tail_ref, val:)
  def first = @head_ref.succ.val
  def last = @tail_ref.pred.val

  def insert_after(node, val:)
    new_node = Node.new(node, val, node.succ)
    node.succ.pred = new_node
    node.succ = new_node
  end

  def insert_before(node, val:)
    new_node = Node.new(node.pred, val, node)
    node.pred.succ = new_node
    node.pred = new_node
  end

  def to_s
    values = []
    it = @head_ref.succ
    while it != @tail_ref
      values.append(it)
      it = it.succ
    end
    values.join
  end
end

# @param {String} s
# @return {String}
def reverse_parentheses(s)
  result = List.new
  stack = [result]
  nestedness = 0
  s.each_char do |char|
    if char == '('
      if nestedness.odd?
        stack.last.prepend(List.new)
        stack.push(stack.last.first)
      else
        stack.last.append(List.new)
        stack.push(stack.last.last)
      end
      nestedness += 1
    elsif char == ')'
      nestedness -= 1
      stack.pop
    elsif nestedness.odd?
      stack.last.prepend(char)
    else
      stack.last.append(char)
    end
  end
  result.to_s
end
