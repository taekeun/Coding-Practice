require_relative 'ruby_solution'

describe do
  context "Encode" do
    it do expect(encode("bananabar")).to eq(["nnbbraaaa", 4]) end
    it do expect(encode("Humble Bundle")).to eq(["e emnllbduuHB", 2]) end
    it do expect(encode("Mellow Yellow")).to eq(["ww MYeelllloo", 1]) end
  end
  context "Decode" do
    it do expect(decode("nnbbraaaa", 4)).to eq("bananabar") end
    it do expect(decode("e emnllbduuHB", 2)).to eq("Humble Bundle") end
    it do expect(decode("ww MYeelllloo", 1)).to eq("Mellow Yellow") end
  end
end
