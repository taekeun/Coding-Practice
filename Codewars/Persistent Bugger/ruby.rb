#!/bin/ruby

# https://www.codewars.com/kata/55bf01e5a717a0d57e0000ec/train/ruby
# 6 kyu Persistent Bugger


def persistence(n)
  worker(n, 0)
end

def worker(n, i)
  return i if n < 10

  # 자릿수로 별로 숫자를 분해해야 하네.
  # 문자열로 바꿔서 처리하는게 간편할듯.
end

puts persistence(39) == 3
puts persistence(4) == 0
