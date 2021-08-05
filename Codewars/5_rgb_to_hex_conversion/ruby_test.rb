require_relative 'ruby_solution'

RSpec.describe('RGB To Hex Conversion') do
    it do expect(rgb(0, 0, 0)).to eq('000000') end
    it do expect(rgb(0, 0, -20)).to eq('000000') end
    it do expect(rgb(300,255,255)).to eq('FFFFFF') end
    it do expect(rgb(173,255,47)).to eq('ADFF2F') end
end



