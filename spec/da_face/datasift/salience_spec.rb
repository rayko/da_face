require 'spec_helper'

describe DaFace::Datasift::Salience do
  describe '#new' do
    before do
      @data = json_fixture('salience/simple.json')
    end
    
    it 'creates Salience object' do
      obj = DaFace::Datasift::Salience.new @data
      
      expect(obj.class).to eq(DaFace::Datasift::Salience)
    end
  end

  describe 'attributes' do
    before do
      @data = json_fixture('salience/simple.json')
      @salience = DaFace::Datasift::Salience.new @data
    end
    
    it 'has all required attributes' do
      expect(@salience.content).to eq(@data['content'])
    end

    it 'returns sentiment value' do
      expect(@salience.sentiment).to eq(@data['content']['sentiment'])
    end
  end

end
