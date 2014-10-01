require 'spec_helper'

describe DaFace::Datasift::Interaction do
  describe '#new' do
    before do
      @interaction_data = JSON.parse(File.read(fixture('interactions/simple.json')))['interaction']
    end
    
    it 'creates Interaction object with data' do
      obj = DaFace::Datasift::Interaction.new @interaction_data
      
      expect(obj.class).to eq(DaFace::Datasift::Interaction)
    end
  end


  describe 'attributes' do
    before do
      @interaction_data = JSON.parse(File.read(fixture('interactions/simple.json')))['interaction']
      @interaction = DaFace::Datasift::Interaction.new @interaction_data
    end

    it 'has all attributes required' do
      expect(@interaction.author).to      eq(@interaction_data['author'])
      expect(@interaction.content).to     eq(@interaction_data['content'])
      expect(@interaction.created_at).to  eq(Time.parse(@interaction_data['created_at']))
      expect(@interaction.id).to          eq(@interaction_data['id'])
      expect(@interaction.link).to        eq(@interaction_data['link'])
      expect(@interaction.received_at).to eq(Time.at(@interaction_data['received_at']))
      expect(@interaction.schema).to      eq(@interaction_data['schema'])
      expect(@interaction.source).to      eq(@interaction_data['source'])
      expect(@interaction.type).to        eq(@interaction_data['type'])
      expect(@interaction.tags).to        eq(@interaction_data['tags'])
      expect(@interaction.tag_tree).to    eq(@interaction_data['tag_tree'])

    end
  end
end
