#!/bin/ruby

# https://www.codewars.com/kata/513e08acc600c94f01000001/train/ruby
# RGB To Hex Conversion

def hex_code(n)
  hex_codes = ['A', 'B', 'C', 'D', 'E', 'F']
  n < 10 ? n.to_s : hex_codes[n - 10]
end

def hex(n)
  return '00' if n <= 0
  return 'FF' if n >= 255

  n.to_s(16).upcase
#   hex_code(n/16) + hex_code(n%16)
end

def rgb(r, g, b)
  [r,g,b].map{|n| hex(n)}.join

#   "%.2X%.2X%.2X" % ([r,g,b].map{ |n| [[n, 255].min, 0].max })
end