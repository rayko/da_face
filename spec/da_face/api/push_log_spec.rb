require 'spec_helper' 

describe DaFace::Api::PushLog do
  before do
    fixture = json_fixture('api_responses/log.json')
    # TODO Make this tool preetier (symbolize)
    @log_data = DaFace::Api::Adapter.new.symbolize_keys(fixture.keys, fixture)
  end
  describe '#new' do
    it 'creates a PushLog object' do
      obj = DaFace::Api::PushLog.new @log_data
      
      expect(obj.class).to eq(DaFace::Api::PushLog)
    end
  end

  describe 'attributes' do
    before do
      @push_log = DaFace::Api::PushLog.new @log_data
    end

    it 'has required attributes' do
      expect(@push_log.count).to eq(@log_data[:count])
      expect(@push_log.entries.class).to eq(Array)
      expect(@push_log.entries.size).not_to eq(0)
      expect(@push_log.entries.map(&:class).uniq).to eq([DaFace::Api::PushLogEntry])
    end
  end
end
