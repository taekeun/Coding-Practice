
# https://www.hackerrank.com/challenges/magic-square-forming/problem
# > ruby test.rb

require 'test/unit'

class MagicSquare
  attr_accessor :min_cost, :square

  SAMPLE = [4, 9, 2, 3, 5, 7, 8, 1, 6]

  def cost? (raw, result)
    cost = 0
    9.times { |i| cost += (raw[i] - result[i]).abs }
    cost
  end

  def magic_square?(array)
    return false unless array.uniq.length == array.length

    sum = array[0] + array[4] + array[8]
    return false unless sum == array[2] + array[4] + array[6]
    3.times do |i|
      return false unless sum == array[i*3, 3].sum
      return false unless sum == (array[i] + array[i + 3] + array[i + 3*2])
    end
    true
  end

  def initialize(square = [])
    @square = square
    @min_cost = square.empty? ? 999 : cost?(square, SAMPLE)
  end

  def calc_minimum_cost(position, cost, square, remain_numbers)
    update_min_cost(cost) if magic_square?(square)
    return if cost >= @min_cost
    return if position > 8
    return if remain_numbers.empty?

    before = square[position]
    remain_numbers.length.times do |n|
      after = remain_numbers[n]
      square[position] = after

      calc_minimum_cost(
        position + 1,
        cost + (before - after).abs,
        square.clone,
        remain_numbers.clone.tap{ |rn| rn.delete_at(n) }
      )
    end
  end

  def update_min_cost(cost)
    @min_cost = cost if cost < @min_cost
  end
end


def formingMagicSquare(raw)
  magic_square = MagicSquare.new(raw.flatten)
  magic_square.calc_minimum_cost(0, 0, raw.flatten, [1, 2, 3, 4, 5, 6, 7, 8, 9])
  magic_square.min_cost
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
    assert_equal(@sample_a[:cost], MagicSquare.new.cost?(@sample_a[:raw].flatten, @sample_a[:fix].flatten))
    assert_equal(@sample_b[:cost], MagicSquare.new.cost?(@sample_b[:raw].flatten, @sample_b[:fix].flatten))
  end

  def test_magic_square?
    assert_false(MagicSquare.new.magic_square?(@sample_a[:raw].flatten))
    assert_true(MagicSquare.new.magic_square?(@sample_a[:fix].flatten))
    assert_false(MagicSquare.new.magic_square?(@sample_b[:raw].flatten))
    assert_true(MagicSquare.new.magic_square?(@sample_b[:fix].flatten))
    assert_false(MagicSquare.new.magic_square?([[2, 2, 2],
                                                [2, 2, 2],
                                                [2, 2, 2]].flatten))
  end

  def test_result
    assert_equal(@sample_a[:cost], formingMagicSquare(@sample_a[:raw]))
    assert_equal(@sample_b[:cost], formingMagicSquare(@sample_b[:raw]))
    assert_equal(0, formingMagicSquare(@sample_a[:fix]))
    assert_equal(0, formingMagicSquare(@sample_b[:fix]))
  end
end

