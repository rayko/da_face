require 'spec_helper'

describe DaFace::Datasift::Salience do
  before do
    @parser = DaFace::Datasift::Parser.new
    fixture = json_fixture('salience/simple.json')
    @data = @parser.symbolize_keys(fixture.keys, fixture)
  end
  
  describe '#new' do
    
    it 'creates Salience object' do
      obj = DaFace::Datasift::Salience.new @data
      
      expect(obj.class).to eq(DaFace::Datasift::Salience)
    end
  end

  describe 'attributes' do
    before do
      @salience = DaFace::Datasift::Salience.new @data
    end
    
    it 'has all required attributes' do
      expect(@salience.content).to eq(@data[:content])
    end

    it 'returns sentiment value' do
      expect(@salience.sentiment).to eq(@data[:content][:sentiment])
    end
  end

end
