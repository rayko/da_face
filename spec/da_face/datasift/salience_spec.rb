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

end
