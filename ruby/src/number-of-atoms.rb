# @param {String} formula
# @return {String}
def count_of_atoms(formula)
  string_from_atoms(count_atoms(build_tree(split(formula))))
  formula
    .then { split(_1) }
    .then { build_tree(_1) }
    .then { count_atoms(_1) }
    .then { string_from_atoms(_1) }
end

def split(formula)
  items = []
  formula.each_char do |char|
    case [items.last, char]
    in _, 'A'..'Z'
      items.append(char)
    in _, 'a'..'z'
      items.last.concat(char)
    in Integer, '0'..'9'
      items[-1] *= 10
      items[-1] += char.to_i
    in _, '1'..'9'
      items.append(char.to_i)
    in _, '(' | ')'
      items.append(char)
    end
  end
  items
end

def build_tree(items)
  result = []
  stack = [result]
  last_item = nil
  items.each do |item|
    case item
    in '('
      last_item = nil
      expr = []
      stack.last.append(expr)
      stack.push(expr)
    in ')'
      last_item = stack.pop
    in Integer
      last_item.append(item)
    else
      last_item = [item]
      stack.last.append(last_item)
    end
  end
  result
end

def count_atoms(tree)
  case tree
  in String
    { tree => 1 }
  in *expr, Integer => repeat
    count_atoms(expr).transform_values { _1 * repeat }
  in Array
    tree.map { count_atoms(_1) }.reduce({}) do |acc, atoms|
      acc.merge(atoms) { |_k, v1, v2| v1 + v2 }
    end
  end
end

def string_from_atoms(atoms)
  atoms.keys.sort.map do |key|
    next key if atoms[key] == 1

    "#{key}#{atoms[key]}"
  end.join
end
