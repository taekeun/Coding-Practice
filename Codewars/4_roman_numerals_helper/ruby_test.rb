require_relative 'ruby_solution'

describe do
  context "should convert to roman numerals" do
    it do expect(RomanNumerals.to_roman(1000)).to eq("M") end
    it do expect(RomanNumerals.to_roman(1990)).to eq("MCMXC") end
    it do expect(RomanNumerals.to_roman(1999)).to eq("MCMXCIX") end
    it do expect(RomanNumerals.to_roman(2008)).to eq("MMVIII") end
    it do expect(RomanNumerals.to_roman(1666)).to eq("MDCLXVI") end
  end
  context "should convert from roman numerals" do
    it do expect(RomanNumerals.from_roman('M')).to eq(1000) end
    it do expect(RomanNumerals.from_roman('MI')).to eq(1001) end
    it do expect(RomanNumerals.from_roman('MIX')).to eq(1009) end
    it do expect(RomanNumerals.from_roman('MIV')).to eq(1004) end
    it do expect(RomanNumerals.from_roman('MXL')).to eq(1040) end
    it do expect(RomanNumerals.from_roman('MDCLXVI')).to eq(1666) end
    it do expect(RomanNumerals.from_roman('MCMXC')).to eq(1990) end
    it do expect(RomanNumerals.from_roman('MCMXCIX')).to eq(1999) end
    it do expect(RomanNumerals.from_roman('MCMXXVII')).to eq(1927) end
    it do expect(RomanNumerals.from_roman('MMVIII')).to eq(2008) end
  end
end