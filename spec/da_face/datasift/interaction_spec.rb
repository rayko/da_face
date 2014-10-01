require 'spec_helper'

describe DaFace::Datasift::Interaction do
  describe '#new' do
    before do
      @data = JSON.parse(File.read(fixture('interactions/simple.json')))['interaction']
    end
    
    it 'creates Interaction object with data' do
      obj = DaFace::Datasift::Interaction.new @data
      
      expect(obj.class).to eq(DaFace::Datasift::Interaction)
    end
  end


  describe 'attributes' do
    before do
      @data = JSON.parse(File.read(fixture('interactions/simple.json')))['interaction']
      @interaction = DaFace::Datasift::Interaction.new @data
    end

    it 'has all attributes required' do
      expect(@interaction.author).to      eq(@data['author'])
      expect(@interaction.content).to     eq(@data['content'])
      expect(@interaction.created_at).to  eq(Time.parse(@data['created_at']))
      expect(@interaction.id).to          eq(@data['id'])
      expect(@interaction.link).to        eq(@data['link'])
      expect(@interaction.received_at).to eq(Time.at(@data['received_at']))
      expect(@interaction.schema).to      eq(@data['schema'])
      expect(@interaction.source).to      eq(@data['source'])
      expect(@interaction.type).to        eq(@data['type'])
      expect(@interaction.tags).to        eq(@data['tags'])
      expect(@interaction.tag_tree).to    eq(@data['tag_tree'])

    end
  end
end
