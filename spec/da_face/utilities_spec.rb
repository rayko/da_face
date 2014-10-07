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

  end

end
