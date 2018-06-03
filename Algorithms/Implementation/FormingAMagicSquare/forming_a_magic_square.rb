#!/bin/ruby

# https://www.hackerrank.com/challenges/magic-square-forming/problem
# Forming a Magic Square

require 'json'
require 'stringio'

class MagicSquare
  attr_accessor :min_cost, :square

  SAMPLE_A = [[4, 9, 2],
              [3, 5, 7],
              [8, 1, 6]]
  SAMPLE_B = [[4, 9, 2],
              [3, 5, 7],
              [8, 1, 6]]

  def cost? (raw, result)
    cost = 0
    3.times do |i|
      3.times.map {|j| cost += (raw[i][j] - result[i][j]).abs}
    end
    cost
  end

  def magic_square?(square)
    used_numbers = Array.new(9)
    square.length.times do |i|
      square[i].length.times do |j|
        number = square[i][j]
        return false unless used_numbers[number - 1].nil?
        used_numbers[number - 1] = number
      end
    end

    number = square[0][0] + square[1][1] + square[2][2]
    return false if number != square[0][2] + square[1][1] + square[2][0]
    3.times do |i|
      return false if number != square[i].sum
      return false if number != square[0][i] + square[1][i] + square[2][i]
    end
    true
  end

  def clone_square(square)
    cloned = Array.new(square.length)
    square.length.times {|n| cloned[n] = square[n].clone}
    cloned
  end

  def initialize(square = [])
    @square = square
    @min_cost = if square.empty?
                  999
                else
                  cost_a = cost?(square, SAMPLE_A)
                  cost_b = cost?(square, SAMPLE_B)
                  cost_a < cost_b ? cost_a : cost_b
                end
  end

  def calc_minimum_cost(position, cost, square, remain_numbers)
    update_min_cost(cost) if magic_square?(square)
    return if cost >= @min_cost
    return if position > 8
    return if remain_numbers.empty?

    row = position / 3
    column = position % 3
    before = square[row][column]

    remain_numbers.length.times do |n|
      after = remain_numbers[n]
      square[row][column] = after

      calc_minimum_cost(position + 1, cost + (before - after).abs, clone_square(square), remain_numbers.clone.tap {|rn| rn.delete_at(n)})
    end
  end

  def update_min_cost(cost)
    @min_cost = cost if cost < @min_cost
  end
end

# Complete the formingMagicSquare function below.
def formingMagicSquare(raw)
  magic_square = MagicSquare.new(raw)
  magic_square.calc_minimum_cost(0, 0, raw, [1, 2, 3, 4, 5, 6, 7, 8, 9])
  magic_square.min_cost
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