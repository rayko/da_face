require 'spec_helper'

describe DaFace::Datasift::Link do
  describe '#new' do
    before do
      @single_link = json_fixture('links/simple.json')
      @single_link = DaFace::Datasift::Links.get_elements(@single_link).first
    end

    it 'creates a Link object' do
      obj = DaFace::Datasift::Link.new @single_link

      expect(obj.class).to eq(DaFace::Datasift::Link)
    end
  end

  describe 'attributes' do
    before do
      @single_link = json_fixture('links/simple.json')
      @single_link = DaFace::Datasift::Links.get_elements(@single_link).first
      @link = DaFace::Datasift::Link.new @single_link
    end

    it 'has all required attributes' do
      expect(@link.code).to eq(@single_link['code'])
      expect(@link.created_at).to eq(Time.parse(@single_link['created_at']))
      expect(@link.hops.class).to eq(Array)
      @link.hops.each do |hop|
        expect(hop.kind_of?(URI)).to eq(true)
      end
      expect(@link.meta).to eq(@single_link['meta'])
      expect(@link.normalized_url).to eq(URI(@single_link['normalized_url']))
      expect(@link.retweet_count).to eq(@single_link['retweet_count'])
      expect(@link.title).to eq(@single_link['title'])
      expect(@link.url.kind_of?(URI)).to eq(true)
      expect(@link.url).to eq(URI(@single_link['url']))
    end
  end
end
