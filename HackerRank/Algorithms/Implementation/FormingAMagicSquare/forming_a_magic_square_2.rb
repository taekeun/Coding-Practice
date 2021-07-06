#!/bin/ruby

# https://www.hackerrank.com/challenges/magic-square-forming/problem
# Forming a Magic Square

require 'json'
require 'stringio'

class MagicSquare
  def initialize(square = [])
    @square = square.flatten
    find_magic_squares
  end

  def magic_square?(array)
    sum = array[0] + array[4] + array[8]
    return false unless sum == array[2] + array[4] + array[6]
    3.times do |i|
      return false unless sum == array[i*3, 3].sum
      return false unless sum == (array[i] + array[i + 3] + array[i + 3*2])
    end
    true
  end

  def find_magic_squares
    @magic_squares = []
    [1, 2, 3, 4, 5, 6, 7, 8, 9].permutation do |a|
      @magic_squares.push(a) if magic_square?(a)
    end
    # @magic_squares.each {|ms| puts ms.join(',')}
  end

  def calc_cost(raw, magic_square)
    cost = 0
    9.times do |i|
      cost += (raw[i] - magic_square[i]).abs
    end
    cost
  end

  def min_cost
    min_cost = 9999
    @magic_squares.each do |ms|
      cost = calc_cost(@square, ms)
      min_cost = cost if cost < min_cost
    end
    min_cost
  end
end

# Complete the formingMagicSquare function below.
def formingMagicSquare(raw)
  MagicSquare.new(raw).min_cost
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

s = Array.new(3)

3.times do |i|
  s[i] = gets.rstrip.split(' ').map(&:to_i)
end

result = formingMagicSquare s

fptr.write result
fptr.write "\n"

fptr.close()