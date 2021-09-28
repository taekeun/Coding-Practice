#!/bin/ruby

# https://www.codewars.com/kata/54ce4c6804fcc440a1000ecb/train/ruby
# Burrows-Wheeler-Transformation

def encode(s)
  rows = [s]
  (1..s.length - 1).each do |i|
    r = rows[i-1]
    rows[i] = r[1..-1] << r[0]
  end
  rows.sort!

  [rows.map{|r| r[-1]}.join, rows.index(s)]
end

def decode(s, n)
  s = s.chars
  rows = s.sort
  rows = rows.map.with_index { |r, i| [r, s[i]] }
  dr = rows.delete_at(n)
  result = Array.new(s.length)
  result[0] = dr.first
  result[-1] = dr.last
  result
  make_row(dr, rows.clone, result.clone)
end
