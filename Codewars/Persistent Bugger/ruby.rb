#!/bin/ruby

# https://www.codewars.com/kata/55bf01e5a717a0d57e0000ec/train/ruby
# 6 kyu Persistent Bugger


def persistence(n)
  worker(n, 0)
end

def worker(n, i)
  return i if n < 10

  worker(
    n.to_s.split("").inject{|m, nn| m.to_i * nn.to_i},
    i+1
  )
end

puts persistence(39) == 3
puts persistence(999) == 4
puts persistence(4) == 0
puts persistence(25) == 2
puts persistence(999) == 4
puts persistence(444) == 3
