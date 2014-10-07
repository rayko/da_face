require 'spec_helper'

describe DaFace::Twitter::Tweet do
  before do
    @parser = DaFace::Datasift::Parser.new
    fixture = json_fixture('twitter/simple.json')
    @data = @parser.symbolize_keys(fixture.keys, fixture)
  end

  describe '#new' do
    it 'creates a Tweet object' do
      obj = DaFace::Twitter::Tweet.new @data
    end
  end
  
  describe 'attributes' do
    before do 
      @tweet = DaFace::Twitter::Tweet.new @data
    end
    
    describe '#id' do
      it 'is present' do
        expect(@tweet.id).to eq(@data[:id].to_i)
      end
    end

    describe '#created_at' do
      it 'is present' do
        expect(@tweet.created_at.class).to eq(Time)
        expect(@tweet.created_at).to eq(Time.parse(@data[:created_at]))
      end
    end

    describe '#lang' do
      it 'is present' do
        expect(@tweet.lang).to eq(@data[:lang])
      end
    end

    describe '#text' do
      it 'is present' do
        expect(@tweet.text).to eq(@data[:text])
      end
    end
    
    describe '#source' do
      it 'is present' do
        expect(@tweet.source).to eq(@data[:source])
      end
    end
    
    describe '#links' do
      it 'is present' do
        expect(@tweet.links.class).to eq(Array)
        expect(@tweet.links.first).to eq(URI(@data[:links].first))
      end
    end

    describe '#retweet?' do
      it 'is present' do
        expect(@tweet.retweet?).to eq(false)
      end
    end
    
    describe '#retweet_count' do
      it 'is present' do
        expect(@tweet.retweet_count).to eq(0)
      end
    end
  end
end
