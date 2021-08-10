#!/bin/ruby

# https://www.codewars.com/kata/54a91a4883a7de5d7800009c/train/ruby
# String incrementer

# If the string already ends with a number, the number should be incremented by 1.
# If the string does not end with a number. the number 1 should be appended to the new string.
def increment_string(input)
  snum = input.slice(/\d+$/).to_s
  num = (snum.to_i + 1)
  "#{input.split(/\d+$/).first}#{num.to_s.rjust(snum.length, '0')}"
end