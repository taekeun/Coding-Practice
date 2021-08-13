#!/bin/ruby

# https://www.codewars.com/kata/51e056fe544cf36c410000fb/train/ruby
# Most frequently used words in a text

# A word is a string of letters (A to Z) optionally containing one or more apostrophes (') in ASCII. (No need to handle fancy punctuation.)
# Matches should be case-insensitive, and the words in the result should be lowercased.
# Ties may be broken arbitrarily.
# If a text contains fewer than three unique words, then either the top-2 or top-1 words should be returned, or an empty array if a text contains no words.
def top_3_words(text)
  # 앞, 뒤에 있는 기호는 무시한다.
  # ' 는 몇개라도 봐준다.
  # 중간에 있는 기호는 모르겠는데 일단 그냥 가자.

  # words = {}
  # text.downcase.split.each do |w|
  #   w = w.match(/\w+(?:'*)\w*/).to_s
  #   next if w.empty?
  #   words[w] ? words[w] += 1 : words[w] = 1
  # end
  # words.sort_by{|_, v| -v}[0..2].map{|x| x.first }

  text.downcase.scan(/\w+(?:'*)\w*/).inject(Hash.new(0)){|h, w| h[w] += 1; h}.sort_by{|_, v| -v}[0..2].map{|x| x.first }
end