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

# 풀이 후 다른 유저들 코드를 보니 더 루비스럽게 풀 수 있다.
# persistence(n.digits.reduce(:*))