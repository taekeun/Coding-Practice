
# https://www.hackerrank.com/challenges/matrix-rotation-algo/problem
# > ruby test.rb

require 'test/unit'
require 'byebug'
require 'benchmark'

def flatten_matrix(matrix, arrays = [])
  array = []

  # left side
  matrix.length.times do |i|
    array.push(matrix[i].shift)
    matrix.delete_at(i) if matrix[i].empty?
  end

  # bottom row
  array.push(matrix.pop)

  # right side reverse
  matrix.length.times.reverse_each do |i|
    array.push(matrix[i].pop)
    matrix.delete_at(i) if matrix[i].empty?
  end

  # top row
  top = matrix.shift&.reverse
  array.push(top) if top

  array.flatten!
  array.compact!

  arrays.push(array) unless array.empty?

  return arrays if matrix.empty?

  flatten_matrix(matrix, arrays)
end

def make_matrix(arrays, layer, matrix)
  r = layer
  c = layer
  rows = matrix.length - (layer * 2)
  columns = matrix.first.length - (layer * 2)

  array = arrays.shift

  #left side
  (1..rows).each do |_|
    matrix[r][c] = array.shift
    r += 1
  end
  r -= 1

  #bottom
  (1..(columns - 1)).each do |_|
    c += 1
    matrix[r][c] = array.shift
  end

  #right
  (1..(rows - 1)).each do |_|
    r -= 1
    matrix[r][c] = array.shift
  end

  #top
  (1..(columns - 1)).each do |_|
    break if array.empty?
    c -= 1
    matrix[r][c] = array.shift
  end

  return matrix if arrays.empty?

  make_matrix(arrays, layer + 1, matrix)
end

def rotate(arrays, r)
  arrays.map do |array|
    a = Array.new(array.length)
    array.each_with_index do |v, i|
      a[(i+r)%array.length] = v
    end
    a
  end
end

def puts_matrix_rotation(matrix, r)
  m = matrix_rotation(matrix, r)
  m.each {|a| puts a.join(' ')}
end

def matrix_rotation(matrix, r)
  rows = matrix.length
  columns = matrix.first.length
  flattened = flatten_matrix(matrix)
  flattened = rotate(flattened, r)
  make_matrix(flattened, 0, Array.new(rows).map!{Array.new(columns)})
end

class TestSolution < Test::Unit::TestCase
  def setup
    @sample_a = {
      raw: [[1, 2, 3, 4],
            [5, 6, 7, 8],
            [9, 10, 11, 12],
            [13, 14, 15, 16]
      ],
      result: [[3, 4, 8, 12],
               [2, 11, 10, 16],
               [1, 7, 6, 15],
               [5, 9, 13, 14]],
      r: 2
    }
    @sample_b = {
      raw: [[1, 2, 3, 4],
            [7, 8, 9, 10],
            [13, 14, 15, 16],
            [19, 20, 21, 22],
            [25, 26, 27, 28]],
      result: [[28, 27, 26, 25],
            [22, 9, 15, 19],
            [16, 8, 21, 13],
            [10, 14, 20, 7],
            [4, 3, 2, 1]],
      r: 7
    }
    @sample_c = {
      raw: [[1, 1],
            [1, 1]],
      result: [[1, 1],
               [1, 1]],
      r: 3
    }
    @sample_d = {
      raw: Array.new(300).tap{|a| a.map!{Array.new(300).fill(1)}},
      result: Array.new(300).tap{|a| a.map!{Array.new(300).fill(1)}},
      r: 10**9
    }
  end

  def test_flatten_matrix
    # pend
    assert_equal([[1]], flatten_matrix([[1]]))
    assert_equal([[1, 3, 4, 2]], flatten_matrix([[1, 2], [3, 4]]))
    assert_equal([[1, 4, 5, 6, 3, 2]], flatten_matrix([[1, 2, 3], [4, 5, 6]]))
    assert_equal([[1, 5, 9, 13, 14, 15, 16, 12, 8, 4, 3, 2],
                  [6, 10, 11, 7]],
                 flatten_matrix(@sample_a[:raw]))
    assert_equal([[1, 7, 13, 19, 25, 26, 27, 28, 22, 16, 10, 4, 3, 2],
                  [8, 14, 20, 21, 15, 9]],
                 flatten_matrix(@sample_b[:raw]))
  end

  def test_make_matrix
    # pend
    assert_equal([[1]], make_matrix([[1]], 0, Array.new(1).tap{|a| a.map!{Array.new(1)}}))
    assert_equal([[1, 2], [3, 4]], make_matrix([[1, 3, 4, 2]], 0, Array.new(2).tap{|a| a.map!{Array.new(2)}}))
    assert_equal([[1, 2, 3], [4, 5, 6]], make_matrix([[1, 4, 5, 6, 3, 2]], 0, Array.new(2).tap{|a| a.map!{Array.new(3)}}))
    assert_equal(@sample_a[:raw],
                 make_matrix([[1, 5, 9, 13, 14, 15, 16, 12, 8, 4, 3, 2],
                              [6, 10, 11, 7]],
                             0, Array.new(4).tap{|a| a.map!{Array.new(4)}}))
    assert_equal(@sample_b[:raw],
                 make_matrix([[1, 7, 13, 19, 25, 26, 27, 28, 22, 16, 10, 4, 3, 2],
                                 [8, 14, 20, 21, 15, 9]],
                             0, Array.new(5).tap{|a| a.map!{Array.new(4)}}))
  end

  def test_rotate_all
    # pend
    assert_equal([[1]], rotate([[1]], 1))
    assert_equal([[3, 1, 2], [6, 4, 5]], rotate([[1, 2, 3], [4, 5, 6]], 1))
    assert_equal([[2, 3, 1], [5, 6, 4]], rotate([[1, 2, 3], [4, 5, 6]], 2))
  end

  def test_result
    assert_equal([[1]], matrix_rotation([[1]], 1))
    assert_equal(@sample_a[:result], matrix_rotation(@sample_a[:raw], @sample_a[:r]))
    assert_equal(@sample_b[:result], matrix_rotation(@sample_b[:raw], @sample_b[:r]))
    assert_equal(@sample_c[:result], matrix_rotation(@sample_c[:raw], @sample_c[:r]))
    # assert_equal(@sample_d[:result], matrix_rotation(@sample_d[:raw], @sample_d[:r]))
  end
end
