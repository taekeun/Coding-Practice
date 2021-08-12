#!/bin/ruby

# https://www.codewars.com/kata/51b66044bce5799a7f000003/train/ruby
# Roman Numerals Helper

# RomanNumerals
# I	1
# IV	4
# V	5
# X	10
# L	50
# C	100
# D	500
# M	1000
class RomanNumerals
  SYMBOLS = { 'M' => 1000, 'CM' => 900, 'D' => 500, 'CD' => 400,
              'C' => 100, 'XC' => 90, 'L' => 50, 'XL' => 40,
              'X' => 10, 'IX' => 9, 'V' => 5, 'IV' => 4, 'I' => 1 }
  class << self
    def to_roman(num)
      to_r(num, 0)
    end

    def from_roman(roman)
      from_r(roman)
    end

    def to_r(num, i)
      return "" if num == 0

      n = SYMBOLS.values[i]
      s = SYMBOLS.key(n)
      s * (num / n) + to_r(num % n, i + 1)
    end

    def from_r(roman)
      return 0 if roman.empty?

      rs = SYMBOLS[roman[0]] < SYMBOLS[roman[1]].to_i ? roman[0..1] : roman[0]
      SYMBOLS[rs] + from_r(roman[rs.length..-1])
    end
  end
end