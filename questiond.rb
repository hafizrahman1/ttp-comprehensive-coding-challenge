def stringPermutations(s)
  return [s] if s.size < 2
  ch = s[0]
  stringPermutations(s[1..-1]).each_with_object([]) do |perm, result|
    (0..perm.size).each { |i| result << perm.dup.insert(i,ch) }
  end
end
