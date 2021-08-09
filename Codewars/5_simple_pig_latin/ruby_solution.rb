#!/bin/ruby

# https://www.codewars.com/kata/520b9d2ad5c005041100000f/train/ruby
# Simple Pig Latin

def changer(t)
  f = t[0]
  return t unless f.match?(/[a-zA-Z]/)

  l = t[1..-1]
  l.concat(f, "ay")
end

def pig_it text
  text.split.map { |t| changer(t) }.join(" ")
end