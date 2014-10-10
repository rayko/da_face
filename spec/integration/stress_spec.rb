require 'spec_helper'

describe DaFace::Datasift do
  context 'with lots of valid data' do
    before do
      @data = fixture('interactions/collection.json')
      @parser = DaFace::Datasift::Parser.new
    end

    it 'does not raise errors' do
      expect(Proc.new{@result = @parser.parse_collection(@data)}).not_to raise_error
      expect(@result.kind_of?(Array)).to eq(true)
      expect(@result.size).not_to eq(0)
    end
  end
end
