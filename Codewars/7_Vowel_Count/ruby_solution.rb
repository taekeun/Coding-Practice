#!/bin/ruby

# https://www.codewars.com/kata/54ff3102c1bad923760001f3/train/ruby
# 7 kyu Vowel Count

# vowels 모음. a, e, i, o, u ( not y in this Kata)

def get_count(input_str)
  input_str.count('aeiou')
end