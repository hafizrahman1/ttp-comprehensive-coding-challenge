def countWays(n)
  # a child can climb to stair n from stair n-1, or stair n-2 or stair n-3.
  # the ways to climb to n is adding up all the ways to n-1, n-2 and n-3. 

  # base case
  if n < 0
    return 0
  elsif n == 0
    return 1
  else
  # recursive case
    return countWays(n-1) + countWays(n-2) + countWays(n-3)
  end
end
