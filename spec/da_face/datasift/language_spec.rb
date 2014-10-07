require 'spec_helper'

describe DaFace::Datasift::Language do
  before do
    fixture = json_fixture('language/simple.json')
    @parser = DaFace::Datasift::Parser.new
    @data = @parser.symbolize_keys(fixture.keys, fixture)
  end

  describe '#new' do
    it 'creates Language object' do
      obj = DaFace::Datasift::Language.new @data

      expect(obj.class).to eq(DaFace::Datasift::Language)
    end

    it 'creates empty Language' do
      expect(Proc.new{DaFace::Datasift::Language.new}).not_to raise_error
    end
  end

  describe 'attributes' do
    before do
      @language = DaFace::Datasift::Language.new @data
    end
    
    describe '#confidence' do
      it 'is present' do
        expect(@language.confidence).to eq(@data[:confidence])
      end
    end

    describe '#tag' do
      it 'is present' do
        expect(@language.tag).to eq(@data[:tag])
      end
    end
    
    describe '#tag_extended' do
      it 'is present' do
        expect(@language.tag_extended).to eq(@data[:tag_extended])
      end
    end
  end
end
