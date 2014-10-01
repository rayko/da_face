require 'spec_helper'

describe DaFace::Datasift::Language do
  describe '#new' do
    before do
      @data = json_fixture('language/simple.json')
    end

    it 'creates Language object' do
      obj = DaFace::Datasift::Language.new @data

      expect(obj.class).to eq(DaFace::Datasift::Language)
    end
  end

  describe 'attributes' do
    before do
      @data = json_fixture('language/simple.json')
      @language = DaFace::Datasift::Language.new @data
    end
    
    it 'has all attributes required' do
      expect(@language.confidence).to eq(@data['confidence'])
      expect(@language.tag).to eq(@data['tag'])
      expect(@language.tag_extended).to eq(@data['tag_extended'])
    end
  end

  

end
