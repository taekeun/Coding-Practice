require_relative 'ruby_solution'

RSpec.describe "Persistence" do
  it "Basic tests" do
    expect(persistence(39)).to eq(3)
    expect(persistence(4)).to eq(0)
    expect(persistence(25)).to eq(2)
    expect(persistence(999)).to eq(4)
    expect(persistence(444)).to eq(3)
  end
end