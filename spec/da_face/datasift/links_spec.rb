require 'spec_helper'

describe DaFace::Datasift::Links do
  describe '#new' do
    before do
      @data = json_fixture('links/simple.json')
    end

    it 'returns array of Link objects' do
      obj = DaFace::Datasift::Links.new @data

      expect(obj.class).to eq(DaFace::Datasift::Links)
      obj.each do |o|
        expect(o.class).to eq(DaFace::Datasift::Link)
      end
    end

    it 'cereates empty Links' do
      expect(Proc.new{DaFace::Datasift::Links.new}).not_to raise_error
    end
  end

  describe '#get_values' do
    before do
      @hash = {
        'key_1' => [1,2], 
        'key_2' => {'key_3' => [3,4]},
        'key_4' => {'key_5' => {'key_6' => [5,6]}}
      }
    end
    it 'returns specific elements of arrays inside the hash' do
      new_hash = DaFace::Datasift::Links.get_values(0, @hash.keys, @hash)

      expect(new_hash['key_1'].class).not_to eq(Array)
      expect(new_hash['key_1']).to eq(1)
      expect(new_hash['key_2'].class).to eq(Hash)
      expect(new_hash['key_2']['key_3']).to eq(3)
      expect(new_hash['key_4']['key_5']['key_6']).to eq(5)
    end
  end

  describe '#get_elements' do
    context 'for single link' do
      before do
        @data = json_fixture('links/simple.json')
      end

      it 'gets first (0) elements of embebbed arrays' do
        hashed_links = DaFace::Datasift::Links.get_elements @data

        expect(hashed_links.class).to eq(Array)
        expect(hashed_links.size).to eq(1)
      end

    end

    context 'for multiples links' do
      before do
        @data = json_fixture('links/multiples.json')
      end
      
      it 'gets first (0) elements of embebbed arrays' do
        hashed_links = DaFace::Datasift::Links.get_elements @data

        expect(hashed_links.class).to eq(Array)
        expect(hashed_links.size).to eq(2)
      end
    end
  end
end
