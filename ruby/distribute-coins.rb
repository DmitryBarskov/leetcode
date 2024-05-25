def distribute_coins(root)
  recur = lambda do |node|
    return [0, 0] if node.nil?

    extra_left, l_moves = recur.(node.left)
    extra_right, r_moves = recur.(node.right)

    [
      extra_left + extra_right + node.val - 1,
      extra_left.abs + l_moves + extra_right.abs + r_moves
    ]
  end

  recur.(root)[1]
end
