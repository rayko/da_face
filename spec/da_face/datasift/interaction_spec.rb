require 'spec_helper'

describe DaFace::Datasift::Interaction do
  before do
    @interaction_data = JSON.parse(File.read(fixture('interactions/simple.json')))['interaction']
  end
  
  it 'creates Interaction object with data' do
    obj = DaFace::Datasift::Interaction.new @interaction_data

    expect(obj.class).to eq(DaFace::Datasift::Interaction)
  end
end
