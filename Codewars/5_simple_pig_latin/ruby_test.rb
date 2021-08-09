require_relative 'ruby_solution'

RSpec.describe do
    it do expect(pig_it('Pig latin is cool')).to eq('igPay atinlay siay oolcay') end
    it do expect(pig_it('This is my string')).to eq('hisTay siay ymay tringsay') end
    it do expect(pig_it('Hello world !')).to eq('elloHay orldway !') end
end



