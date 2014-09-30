require 'spec_helper'

describe DaFace::Datasift::Parser do
  before do
    @parser = DaFace::Datasift::Parser.new
    @json = File.open(fixture('interactions/simple.json')).read
  end

  it 'exists' do
    expect(DaFace::Datasift::Parser.hello).to eq(true)
  end

  it 'creates a DaObject from json' do
    expect(@parser.parse_from_json(@json).class).to eq(DaFace::Datasift::DaObject)
  end

  it 'raises error when no json is provided' do
    expect(Proc.new{@parser.parse_from_json}).to raise_error(DaFace::Datasift::MissingJson)
  end

end
