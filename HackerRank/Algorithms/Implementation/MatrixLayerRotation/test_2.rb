
# https://www.hackerrank.com/challenges/matrix-rotation-algo/problem
# > ruby test.rb

require 'test/unit'
require 'byebug'
require 'benchmark'

module Direction
  DOWN = 1
  RIGHT = 2
  UP = 3
  LEFT = 4
end

def side_adder(cur, limit, rotate)
  v = limit - cur
  if v.abs < rotate
    cur += v
    rotate -= v.abs
  else
    cur += rotate * ( v < 0 ? -1 : 1)
    rotate = 0
  end
  [cur, rotate]
end

def move_side(cur_row, cur_col, min_row, max_row, min_col, max_col, rotate)
  d = get_direction(cur_row, cur_col, min_row, max_row, min_col, max_col)

  case d
  when Direction::DOWN
    cur_row, rotate = side_adder(cur_row, max_row, rotate)
  when Direction::RIGHT
    cur_col, rotate = side_adder(cur_col, max_col, rotate)
  when Direction::UP
    cur_row, rotate = side_adder(cur_row, min_row, rotate)
  when Direction::LEFT
    cur_col, rotate = side_adder(cur_col, min_col, rotate)
  end

  return [cur_row, cur_col, rotate]
end

def get_direction(row, col, min_row, max_row, min_col, max_col)
  if row < max_row && col == min_col # move down
    Direction::DOWN
  elsif row == max_row && col < max_col # move right
    Direction::RIGHT
  elsif row > min_row && col == max_col # move up
    Direction::UP
  else # move left
    Direction::LEFT
  end
end

def rotated_position(cur_row, cur_col, rows, cols, rotate)
  return [cur_row, cur_col] if rows == 1 && cols == 1
  layer = current_layer(cur_row, cur_col, rows - 1, cols - 1)
  min_row = min_col = layer
  max_row = (rows - 1) - layer
  max_col = (cols - 1) - layer

  max_length = (max_row + 1) * 2 + (max_col + 1) * 2 - 4
  rotate = rotate % max_length

  until rotate <= 0
    cur_row, cur_col, rotate = move_side(cur_row, cur_col, min_row, max_row, min_col, max_col, rotate)
  end

  [cur_row, cur_col]
end

def current_layer(cur_row, cur_col, max_row, max_col)
  [cur_row, cur_col, max_row - cur_row, max_col - cur_col].min
end

def matrix_rotation(matrix, rotate)
  row_len = matrix.length
  col_len = matrix.first.length
  r_matrix = Array.new(row_len).tap {|a| a.map!{Array.new(col_len)}}

  row_len.times do |r|
    col_len.times do |c|
      new_position = rotated_position(r, c, row_len, col_len, rotate)
      r_matrix[new_position.first][new_position.last] = matrix[r][c]
    end
  end
  r_matrix
end

def puts_matrix_rotation(matrix, r)
  m = matrix_rotation(matrix, r)
  m.each {|a| puts a.join(' ')}
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

  def test_move_side
    # down
    assert_equal([1, 0, 0], move_side(0, 0, 0, 2, 0, 2, 1))
    assert_equal([2, 0, 0], move_side(0, 0, 0, 2, 0, 2, 2))
    assert_equal([2, 0, 1], move_side(0, 0, 0, 2, 0, 2, 3))

    # right
    assert_equal([2, 1, 0], move_side(2, 0, 0, 2, 0, 2, 1))
    assert_equal([2, 2, 0], move_side(2, 0, 0, 2, 0, 2, 2))
    assert_equal([2, 2, 1], move_side(2, 0, 0, 2, 0, 2, 3))

    # up
    assert_equal([1, 2, 0], move_side(2, 2, 0, 2, 0, 2, 1))
    assert_equal([0, 2, 0], move_side(2, 2, 0, 2, 0, 2, 2))
    assert_equal([0, 2, 1], move_side(2, 2, 0, 2, 0, 2, 3))

    # left
    assert_equal([0, 1, 0], move_side(0, 2, 0, 2, 0, 2, 1))
    assert_equal([0, 0, 0], move_side(0, 2, 0, 2, 0, 2, 2))
    assert_equal([0, 0, 1], move_side(0, 2, 0, 2, 0, 2, 3))
  end

  def test_layer
    assert_equal(0, current_layer(0, 0, 3, 3))
    assert_equal(1, current_layer(1, 1, 3, 3))
    assert_equal(0, current_layer(3, 3, 3, 3))
    assert_equal(1, current_layer(1, 3, 5, 4))
  end

  def test_rotated_position
    assert_equal([1, 0], rotated_position(0, 0, 4, 4, 1))
    assert_equal([0, 1], rotated_position(0, 0, 4, 4, 11))
  end

  def test_rotate
    assert_equal([[1]], matrix_rotation([[1]], 1))

    assert_equal([[2, 1]], matrix_rotation([[1, 2]], 1))
    assert_equal([[1, 2]], matrix_rotation([[1, 2]], 2))
    assert_equal([[2, 1]], matrix_rotation([[1, 2]], 3))

    assert_equal([[2], [1]], matrix_rotation([[1], [2]], 1))
    assert_equal([[1], [2]], matrix_rotation([[1], [2]], 2))
    assert_equal([[2], [1]], matrix_rotation([[1], [2]], 3))

    assert_equal([[2, 3, 6],
                  [1, 4, 5]], matrix_rotation([[1, 2, 3],
                                               [4, 5, 6]], 1))
    assert_equal([[3, 6, 5],
                  [2, 1, 4]], matrix_rotation([[1, 2, 3],
                                               [4, 5, 6]], 2))
    assert_equal(@sample_a[:result], matrix_rotation(@sample_a[:raw], @sample_a[:r]))
    assert_equal(@sample_b[:result], matrix_rotation(@sample_b[:raw], @sample_b[:r]))
    assert_equal(@sample_c[:result], matrix_rotation(@sample_c[:raw], @sample_c[:r]))
    assert_equal(@sample_d[:result], matrix_rotation(@sample_d[:raw], @sample_d[:r]))
  end
end
