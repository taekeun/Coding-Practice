require_relative 'ruby_solution'

RSpec.describe do
  it do expect(increment_string("foo")).to eq("foo1") end
  it do expect(increment_string("foobar001")).to eq("foobar002") end
  it do expect(increment_string("foobar1")).to eq("foobar2") end
  it do expect(increment_string("foobar00")).to eq("foobar01") end
  it do expect(increment_string("foobar99")).to eq("foobar100") end
  it do expect(increment_string("")).to eq("1") end
end



