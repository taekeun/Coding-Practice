require_relative 'ruby_solution'

describe do
  it do expect(top_3_words("a a a  b  c c  d d d d  e e e e e")).to eq(["e", "d", "a"]) end
  it do expect(top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e")).to eq(["e", "ddd", "aa"]) end
  it do expect(top_3_words("  //wont won't won't ")).to eq(["won't", "wont"]) end
  it do expect(top_3_words("  , e   .. ")).to eq(["e"]) end
  it do expect(top_3_words("  ...  ")).to eq([]) end
  it do expect(top_3_words("  '  ")).to eq([]) end
  it do expect(top_3_words("  '''  ")).to eq([]) end
  it do expect(
    top_3_words("""In a village of La Mancha, the name of which I have no desire to call to
mind, there lived not long since one of those gentlemen that keep a lance
in the lance-rack, an old buckler, a lean hack, and a greyhound for
coursing. An olla of rather more beef than mutton, a salad on most
nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
on Sundays, made away with three-quarters of his income.""")
  ).to eq(["a", "of", "on"]) end
end