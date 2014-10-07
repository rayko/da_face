require 'spec_helper'

describe DaFace::Datasift::Demographic do
  describe '#new' do
    before do
      @data = json_fixture('demographic/simple.json')
    end

    it 'creates Demographic object' do
      obj = DaFace::Datasift::Demographic.new @data

      expect(obj.class).to eq(DaFace::Datasift::Demographic)
    end

    it 'creates empty Demographic' do
      expect(Proc.new{DaFace::Datasift::Demographic.new}).not_to raise_error
    end
  end

  describe 'attributes' do
    before do
      @data = json_fixture('demographic/simple.json')
      @demographic = DaFace::Datasift::Demographic.new @data
    end

    it 'has all attributes required' do
      expect(@demographic.gender).to eq(@data['gender'])
    end
  end
end
