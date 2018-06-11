
# https://www.hackerrank.com/challenges/picking-numbers/problem
# > ruby test.rb

require 'test/unit'

def picking_numbers(numbers)
  sorted_numbers = numbers.sort
  unique_numbers = sorted_numbers.uniq
  max = 0
  unique_numbers.each do |n|
    len = length_of_subarray(n, sorted_numbers)
    max = len if len > max
  end
  max
end

def length_of_subarray(number, numbers)
  start_index = numbers.find_index(number)
  numbers[start_index..numbers.length].select{ |num| (num - number).abs <= 1 }.length
end

class TestSolution < Test::Unit::TestCase
  def setup
    @sample_a = {
      raw: [4, 6, 5, 3, 3, 1],
      result: 3
    }
    @sample_b = {
      raw: [1, 2, 2, 3, 1, 2],
      result: 5
    }
    @sample_c = {
      raw: [1, 1, 2, 2, 4, 4, 5, 5, 5],
      result: 5
    }
  end

  def test_result
    assert_equal(@sample_a[:result], picking_number(@sample_a[:raw]))
    assert_equal(@sample_b[:result], picking_number(@sample_b[:raw]))
    assert_equal(@sample_c[:result], picking_number(@sample_c[:raw]))
  end
end
