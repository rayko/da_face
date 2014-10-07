require 'spec_helper'

describe DaFace::Datasift::Interaction do
  before do
    @parser = DaFace::Datasift::Parser.new
    fixture = json_fixture('interaction/simple.json')
    @data = @parser.symbolize_keys(fixture.keys, fixture)
  end
  describe '#new' do
    it 'creates Interaction object' do
      obj = DaFace::Datasift::Interaction.new @data
      
      expect(obj.class).to eq(DaFace::Datasift::Interaction)
    end

    it 'creates empty Interaction' do
      expect(Proc.new{DaFace::Datasift::Interaction.new}).not_to raise_error
    end
  end

  describe 'attributes' do
    before do
      @interaction = DaFace::Datasift::Interaction.new @data
    end

    describe '#author' do
      it 'is present' do
        expect(@interaction.author).to eq(@data[:author])
      end
    end

    describe '#content' do
      it 'is present' do
        expect(@interaction.content).to eq(@data[:content])
      end
    end

    describe '#created_at' do
      it 'is present' do
        expect(@interaction.created_at).to eq(Time.parse(@data[:created_at]))
      end
    end

    describe '#id' do
      it 'is present' do
        expect(@interaction.id).to eq(@data[:id])
      end
    end

    describe '#link' do
      it 'is present' do
        expect(@interaction.link).to eq(@data[:link])
      end
    end

    describe '#received_at' do
      it 'is present' do
        expect(@interaction.received_at).to eq(Time.at(@data[:received_at]))
      end
    end

    describe '#schema' do
      it 'is present' do
        expect(@interaction.schema).to eq(@data[:schema])
      end
    end
    
    describe '#source' do
      it 'is present' do
        expect(@interaction.source).to  eq(@data[:source])
      end
    end

    describe '#type' do
      it 'is present' do
        expect(@interaction.type).to eq(@data[:type])
      end
    end

    describe '#tags' do
      it 'it is present' do
        expect(@interaction.tags).to eq(@data[:tags])
      end
    end

    describe '#tag_tree' do
      it 'is present' do
        expect(@interaction.tag_tree).to eq(@data[:tag_tree])
      end
    end

  end
end
