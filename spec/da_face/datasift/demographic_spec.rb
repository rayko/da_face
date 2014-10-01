require 'spec_helper'

describe DaFace::Datasift::Demographic do
  describe '#new' do
    before do
      @data = JSON.parse(File.read(fixture('interactions/simple.json')))['demographic']
    end

    it 'creates Demographic object' do
      obj = DaFace::Datasift::Demographic.new @data

      expect(obj.class).to eq(DaFace::Datasift::Demographic)
    end
  end

  describe 'attributes' do
    before do
      @data = JSON.parse(File.read(fixture('interactions/simple.json')))['demographic']
      @demographic = DaFace::Datasift::Demographic.new @data
    end

    it 'has all attributes required' do
      expect(@demographic.gender).to eq(@data['gender'])
    end
  end
end
