require 'spec_helper'

describe DaFace::Datasift::Twitter do
  before do
    @parser = DaFace::Datasift::Parser.new
  end
  describe '#new' do
    before do
      fixture = json_fixture('twitter/simple.json')
      @data = @parser.symbolize_keys(fixture.keys, fixture)
    end
    
    it 'creates a Twitter object' do
      obj = DaFace::Datasift::Twitter.new @data
      
      expect(obj.class).to eq(DaFace::Datasift::Twitter)
    end
  end

  describe 'attributes' do
    context 'normal tweet' do
      before do
        fixture = json_fixture('twitter/simple.json')
        @data = @parser.symbolize_keys(fixture.keys, fixture)
        @twitter = DaFace::Datasift::Twitter.new @data
      end
      it 'has tweet information' do
        expect(@twitter.tweet).not_to eq(nil)
        expect(@twitter.retweeted).to eq(nil)
        expect(@twitter.tweet.id).to eq(@data[:id].to_i)
        expect(@twitter.retweet?).to eq(false)
      end
    end
    
    context 'retweet' do
      before do
        fixture = json_fixture('twitter/retweet.json')
        @data = @parser.symbolize_keys(fixture.keys, fixture)
        @twitter = DaFace::Datasift::Twitter.new @data
      end
      it 'has tweet and retweet information' do
        expect(@twitter.tweet).not_to eq(nil)
        expect(@twitter.retweeted).not_to eq(nil)
        expect(@twitter.tweet.id).to eq(@data[:retweet][:id].to_i)
        expect(@twitter.retweeted.id).to eq(@data[:retweeted][:id].to_i)
        expect(@twitter.retweeted.id).not_to eq(@twitter.tweet.id)
        expect(@twitter.retweet?).to eq(true)
      end
    end
    



  end
end

