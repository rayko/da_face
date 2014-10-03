require 'spec_helper'

describe DaFace::Datasift::DaObject do
  describe '#new' do
    before do
      @interaction_data = json_fixture('interactions/simple.json')
    end

    it 'creates a DaObject object' do
      obj = DaFace::Datasift::DaObject.new @interaction_data

      expect(obj.class).to eq(DaFace::Datasift::DaObject)
    end
  end

  describe 'attributes' do
    before do 
      @interaction_data = json_fixture('interactions/simple.json')
      @da_object = DaFace::Datasift::DaObject.new @interaction_data
    end

    it 'has all required attriburtes' do
      expect(@da_object.interaction).not_to eq(nil)
      expect(@da_object.demographic).not_to eq(nil)
      expect(@da_object.salience).not_to eq(nil)
      expect(@da_object.links).not_to eq(nil)
      expect(@da_object.twitter).not_to eq(nil)
      expect(@da_object.language).not_to eq(nil)
    end
  end

end
