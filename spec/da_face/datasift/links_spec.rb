require 'spec_helper'

describe DaFace::Datasift::Links do
  describe '#new' do
    before do
      @data = JSON.parse(File.read(fixture('links/simple.json')))
    end

    it 'creates Links object' do
      obj = DaFace::Datasift::Links.new @data

      expect(obj.class).to eq(DaFace::Datasift::Links)
    end
  end
end
