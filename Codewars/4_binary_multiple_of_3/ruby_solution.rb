#!/bin/ruby

# https://www.codewars.com/kata/54de279df565808f8b00126a/train/ruby
# Binary multiple of 3

# Regular expression that matches binary inputs that are multiple of 3
# multipleOf3Regex = /^[01]+/
multipleOf3Regex = /^(1(01*0)*1|0)+$/

describe do
  it { expect(multipleOf3Regex =~ " 0").to be_nil }
  it { expect(multipleOf3Regex =~ "abc").to be_nil }
  it { expect(multipleOf3Regex =~ "011 110").to be_nil }

  it { expect(multipleOf3Regex =~ "000").not_to be_nil }
  it { expect(multipleOf3Regex =~ "001").to be_nil }
  it { expect(multipleOf3Regex =~ "011").not_to be_nil }

  it { expect(multipleOf3Regex =~ "110").not_to be_nil }
  it { expect(multipleOf3Regex =~ "111").to be_nil }
  it { expect(multipleOf3Regex =~ (12345678).to_s(2)).not_to be_nil }
end
