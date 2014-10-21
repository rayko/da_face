# -*- coding: utf-8 -*-
require 'spec_helper'

describe DaFace::Utilities do
  before do
    @utilities = Object.new
    @utilities.extend(DaFace::Utilities)
  end
  
  describe '#symbolize_keys' do
    before do
      @hash = {
        'key8' => ['8.1', '8.2'],
        'key9' => [['9.1']],
        'key1' => '1', 
        'key2' => [{'key3' => '3'}, 
                   {'key7' => '7'}], 
        'key4' => {'key5' => {'key6' => '6'}}}

      @expected =  {
        :key8 => ['8.1', '8.2'],
        :key9 => [['9.1']],
        :key1 => '1', 
        :key2 => [{:key3 => '3'}, 
                   {:key7 => '7'}], 
        :key4 => {:key5 => {:key6 => '6'}}}
    end

    it 'converts hash keys to symbols even in depth' do
      expect(@utilities.symbolize_keys(@hash.keys, @hash)).to eq(@expected)
    end
  end

  describe '#parse_uri' do
    it 'converts string url into URI object' do
      url = 'http://someuri.com/somepath?something=thing'
      expect(@utilities.parse_uri(url).kind_of?(URI)).to eq(true)
      expect(@utilities.parse_uri(url).to_s).to eq(url)
    end

    it 'tolerates unencoded uris' do
      url = "http://openbook.etoro.com/?SMT=2&LID=1&NID=3&eCID=nRZtmeSGur8oFg3j7LSEaQ==&eGCID=tmivAfzoieVW7mLDcSL8rw==&PID=0&IID=11&IsBuy=False&G=62&UGC=I?m very pleased with my latest earnings"
      expect(Proc.new{@utilities.parse_uri(url)}).not_to raise_error
      expect(@utilities.parse_uri(url)).to eq(URI(URI.encode(url)))
    end

    it 'returns same object if unable to parse to URI' do
      expect(@utilities.parse_uri('[]').kind_of?(String)).to eq(true)
    end
  end

  describe '#parse_json' do
    it 'parses json data' do
      data = fixture('interactions/simple.json')
      expect(Proc.new{@utilities.parse_json(data)}).not_to raise_error
      expect(@utilities.parse_json(data).class).to eq(Hash)
    end
  end

  describe '#parse_timestamp' do
    it 'converts fixnum timestam to Time object' do
      time = Time.parse('Fri, 16 May 2014 00:24:08 +0000')
      expect(@utilities.parse_timestamp(time.to_i)).to eq(time)
    end

    it 'returns nil if nothing given' do
      expect(@utilities.parse_timestamp).to eq(nil)
    end

    it 'returns nil if nil given' do
      expect(@utilities.parse_timestamp(nil)).to eq(nil)
    end

    it 'parses a string date time to Time object' do
      time = 'Fri, 16 May 2014 00:24:08 +0000'
      expect(@utilities.parse_timestamp(time)).to eq(Time.parse(time))
    end

    it 'converts float to Time object' do
      time = 1400199848.5762
      expect(@utilities.parse_timestamp(time)).to eq(Time.at(time))
    end

    it 'returns what it gets if not recognized' do
      time = Time.now
      something = Object.new
      expect(@utilities.parse_timestamp(time)).to eq(time)
      expect(@utilities.parse_timestamp(something)).to eq(something)
    end

    it 'tolerates an erroneus string' do
      time = "A\u0529Dú}V"
      expect(Proc.new{@utilities.parse_timestamp(time)}).not_to raise_error
      expect(@utilities.parse_timestamp(time)).to eq(time)
    end

  end

end
