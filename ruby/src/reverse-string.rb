def reverse_string(s)
  i, j = 0, s.size - 1
  while i < j
    s[i], s[j] = s[j], s[i]
    i += 1
    j -= 1
  end
end
