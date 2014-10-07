require 'spec_helper'

describe DaFace::Datasift::Link do
  before do
    fixture = json_fixture('links/simple.json')
    @parser = DaFace::Datasift::Parser.new
    fixture = @parser.symbolize_keys(fixture.keys, fixture)
    @single_link = DaFace::Datasift::Links.get_elements(fixture).first
  end

  describe '#new' do
    it 'creates a Link object' do
      obj = DaFace::Datasift::Link.new @single_link

      expect(obj.class).to eq(DaFace::Datasift::Link)
    end

    it 'does not raise error if nothing is passed' do
      expect(Proc.new{DaFace::Datasift::Link.new}).not_to raise_error
    end
  end

  describe 'attributes' do
    before do
      @link = DaFace::Datasift::Link.new @single_link
    end

    describe '#code' do
      it 'is present' do
        expect(@link.code).to eq(@single_link[:code])
      end
    end

    describe '#created_at' do
      it 'is present' do
        expect(@link.created_at).to eq(Time.parse(@single_link[:created_at]))
      end
    end

    describe '#hops' do
      it 'is present' do
        expect(@link.hops.class).to eq(Array)
        @link.hops.each do |hop|
          expect(hop.kind_of?(URI)).to eq(true)
        end
      end
    end

    describe '#meta' do
      it 'is present' do
        expect(@link.meta).to eq(@single_link[:meta])
      end
    end

    describe '#normalized_url' do
      it 'is present' do
        expect(@link.normalized_url).to eq(URI(@single_link[:normalized_url]))
      end
    end

    describe '#retweet_count' do
      it 'is present' do
        expect(@link.retweet_count).to eq(@single_link[:retweet_count])
      end
    end

    describe '#title' do
      it 'is present' do
        expect(@link.title).to eq(@single_link[:title])
      end
    end

    describe 'url' do
      it 'is present' do
        expect(@link.url.kind_of?(URI)).to eq(true)
        expect(@link.url).to eq(URI(@single_link[:url]))
      end
    end
  end
end
