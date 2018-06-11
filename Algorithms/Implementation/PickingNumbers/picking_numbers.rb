#!/bin/ruby

# https://www.hackerrank.com/challenges/picking-numbers/problem
# Picking Numbers

require 'json'
require 'stringio'

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

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

n = gets.to_i

a = gets.rstrip.split(' ').map(&:to_i)

result = picking_numbers a

fptr.write result
fptr.write "\n"

fptr.close()
