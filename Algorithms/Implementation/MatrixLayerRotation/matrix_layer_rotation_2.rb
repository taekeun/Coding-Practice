#!/bin/ruby
# https://www.hackerrank.com/challenges/matrix-rotation-algo/problem

require 'json'
require 'stringio'

def move_side(cur_row, cur_col, min_row, max_row, min_col, max_col, rotate)
  if cur_row < max_row && cur_col == min_col # move down
    v = max_row - cur_row
    if v < rotate
      cur_row += v
      rotate -= v
    else
      cur_row += rotate
      rotate = 0
    end
  elsif cur_row == max_row && cur_col < max_col # move right
    v = max_col - cur_col
    if v < rotate
      cur_col += v
      rotate -= v
    else
      cur_col += rotate
      rotate = 0
    end
  elsif cur_row > min_row && cur_col == max_col # move up
    v = cur_row - min_row
    if v < rotate
      cur_row -= v
      rotate -= v
    else
      cur_row -= rotate
      rotate = 0
    end
  else # move left
    v = cur_col - min_col
    if v < rotate
      cur_col -= v
      rotate -= v
    else
      cur_col -= rotate
      rotate = 0
    end
  end

  return [cur_row, cur_col, rotate]
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
