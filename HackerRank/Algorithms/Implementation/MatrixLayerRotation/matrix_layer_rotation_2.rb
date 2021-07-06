#!/bin/ruby
# https://www.hackerrank.com/challenges/matrix-rotation-algo/problem

require 'json'
require 'stringio'

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

row, column, r = gets.rstrip.split.map(&:to_i)

matrix = Array.new(row)

row.times do |i|
  matrix[i] = gets.rstrip.split(' ').map(&:to_i)
end

puts_matrix_rotation(matrix, r)
