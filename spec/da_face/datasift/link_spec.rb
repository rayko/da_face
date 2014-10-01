require 'spec_helper'

describe DaFace::Datasift::Link do
  describe '#new' do
    before do
      @single_link = json_fixture('links/simple.json')
      @single_link = DaFace::Datasift::Links.get_elements(@single_link).first
    end

    it 'creates a Link object' do
      obj = DaFace::Datasift::Link.new @single_link

      expect(obj.class).to eq(DaFace::Datasift::Link)
    end
  end
end
