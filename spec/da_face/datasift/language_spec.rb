require 'spec_helper'

describe DaFace::Datasift::Language do
  describe '#new' do
    before do
      @data = JSON.parse(File.read(fixture('interactions/simple.json')))['language']
    end

    it 'creates Language object' do
      obj = DaFace::Datasift::Language.new @data

      expect(obj.class).to eq(DaFace::Datasift::Language)
    end
  end

end
