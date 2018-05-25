
# https://www.hackerrank.com/challenges/magic-square-forming/problem
# > ruby test.rb

require 'test/unit'

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

def formingMagicSquare(raw)
  MagicSquare.new(raw).min_cost
end

class TestSolution < Test::Unit::TestCase
  def setup
    @sample_a = {
      raw: [[4, 9, 2],
            [3, 5, 7],
            [8, 1, 5]],
      fix: [[4, 9, 2],
            [3, 5, 7],
            [8, 1, 6]],
      cost: 1
    }
    @sample_b = {
      raw: [[4, 8, 2],
            [4, 5, 7],
            [6, 1, 6]],
      fix: [[4, 9, 2],
            [3, 5, 7],
            [8, 1, 6]],
      cost: 4
    }
  end

  def test_cost
    assert_equal(@sample_a[:cost], MagicSquare.new.calc_cost(@sample_a[:raw].flatten, @sample_a[:fix].flatten))
    assert_equal(@sample_b[:cost], MagicSquare.new.calc_cost(@sample_b[:raw].flatten, @sample_b[:fix].flatten))
  end

  def test_magic_square?
    assert_true(MagicSquare.new.magic_square?(@sample_a[:fix].flatten))
    assert_true(MagicSquare.new.magic_square?(@sample_b[:fix].flatten))
  end

  def test_result
    assert_equal(@sample_a[:cost], formingMagicSquare(@sample_a[:raw]))
    assert_equal(@sample_b[:cost], formingMagicSquare(@sample_b[:raw]))
    assert_equal(0, formingMagicSquare(@sample_a[:fix]))
    assert_equal(0, formingMagicSquare(@sample_b[:fix]))
  end
end

