#!/bin/ruby
# https://www.hackerrank.com/challenges/matrix-rotation-algo/problem

require 'json'
require 'stringio'

def flatten_matrix(matrix, arrays = [])
  array = []

  # left side
  matrix.length.times do |i|
    array.push(extract_matrix_element(matrix, i, false))
  end
  # bottom row
  array.push(matrix.pop)

  # right side reverse
  matrix.length.times.reverse_each do |i|
    array.push(extract_matrix_element(matrix, i))
  end

  # top side
  top = matrix.shift&.reverse
  array.push(top) if top

  array.flatten!
  array.compact!

  arrays.push(array) unless array.empty?

  return arrays if matrix.empty?

  flatten_matrix(matrix, arrays)
end

def extract_matrix_element(matrix, row, is_last = true)
  element = is_last ? matrix[row].pop : matrix[row].shift
  matrix.delete_at(row) if matrix[row].empty?
  element
end

def make_matrix(arrays, layer, matrix)
  r = layer
  c = layer
  rows = matrix.length - (layer * 2)
  columns = matrix.first.length - (layer * 2)

  array = arrays.shift

  debug array.join(',')
  arrays.each do |a|
    debug a.join(',')
  end

  debug "layer#{layer}"

  puts_matrix matrix
  debug '---'

  #left side
  (1..rows).each do |_|
    matrix[r][c] = array.shift
    r += 1
  end
  r -= 1

  puts_matrix matrix

  #bottom
  (1..(columns - 1)).each do |_|
    c += 1
    matrix[r][c] = array.shift
  end

  puts_matrix matrix

  #right
  (1..(rows - 1)).each do |_|
    r -= 1
    matrix[r][c] = array.shift
  end

  puts_matrix matrix

  #top
  (1..(columns - 1)).each do |_|
    break if array.empty?
    c -= 1
    matrix[r][c] = array.shift
  end

  puts_matrix matrix

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

def puts_matrix(matrix)
  debug 'M'
  matrix.each {|r| debug(r.join(','))}
end

def debug(str)
  # puts str
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

row, column, r = gets.rstrip.split.map(&:to_i)

matrix = Array.new(row)

row.times do |i|
  matrix[i] = gets.rstrip.split(' ').map(&:to_i)
end

puts_matrix_rotation(matrix, r)
