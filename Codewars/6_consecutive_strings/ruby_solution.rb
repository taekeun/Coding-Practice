#!/bin/ruby

# https://www.codewars.com/kata/56a5d994ac971f1ac500003e/train/ruby
# 6 Consecutive strings

def longest_consec(strarr, k)
  return "" if k <= 0 || k > strarr.length
  longest = ""
  strarr.each_with_index do |s, i|
    cs = s
    for j in 1..k-1
      cs += strarr[i+j].to_s
    end
    longest = cs if cs.length > longest.length
  end
  longest
end