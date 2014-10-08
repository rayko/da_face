require 'spec_helper'

describe DaFace::Api::PushSubscription do
  before do
    @attrs = {
      :id => "k3j452kl3j4h5kl23j45h2l34kjh5345",
      :output_type => "http",
      :name => "SomeName",
      :created_at => 1412345259,
      :user_id => 28949,
      :hash => "1m2n3bm12n3b1n23bm1n2b3mn12b3m2n",
      :hash_type => "stream",
      :output_params => {
        :max_size => 2097152,
        :delivery_frequency => 0,
        :url => "http =>//somewhere.com/data_receiver"
      },
      :status => "active",
      :last_request => 1412597788,
      :last_success => 1412597789,
      :remaining_bytes => 100,
      :lost_data => false,
      :start => 1412345259,
      :end => 1412347259
    }
  end

  describe '#new' do
    it 'creates a PushSubscription object' do
      obj = DaFace::Api::PushSubscription.new @attrs

      expect(obj.class).to eq(DaFace::Api::PushSubscription)
    end
    
    it 'creates enpty Pushsubscription' do
      expect(Proc.new{DaFace::Api::PushSubscription.new}).not_to raise_error
    end
  end

  describe 'attributes' do
    before do
      @subscription = DaFace::Api::PushSubscription.new @attrs
    end

    describe '#id' do
      it 'is present' do
        expect(@subscription.id).to eq(@attrs[:id])
      end
    end

    describe '#name' do
      it 'is present' do
        expect(@subscription.name).to eq(@attrs[:name])
      end
    end

    describe '#created_at' do
      it 'is present' do
        expect(@subscription.created_at).to eq(Time.at(@attrs[:created_at]))
      end
    end

    describe '#user_id' do
      it 'is present' do
        expect(@subscription.hash).to eq(@attrs[:hash])
      end
    end

    describe '#hash_type' do
      it 'is present' do
        expect(@subscription.hash_type).to eq(@attrs[:hash_type])
      end
    end

    describe '#status' do
      it 'is present' do
        expect(@subscription.status).to eq(@attrs[:status])
      end
    end

    describe '#last_request' do
      it 'is present' do
        expect(@subscription.last_request).to eq(Time.at(@attrs[:last_request]))
      end
    end

    describe '#last_success' do
      it 'is present' do
        expect(@subscription.last_success).to eq(Time.at(@attrs[:last_success]))
      end
    end

    describe '#remaining_bytes' do
      it 'is present' do
        expect(@subscription.remaining_bytes).to eq(@attrs[:remaining_bytes])
      end
    end

    describe '#lost_data' do
      it 'is present' do
        expect(@subscription.lost_data).to eq(@attrs[:lost_data])
      end
    end

    describe '#lost_data?' do
      it 'returns same as #lost_data' do
        expect(@subscription.lost_data?).to eq(@subscription.lost_data)
      end
    end

    describe '#start' do
      it 'is present' do
        expect(@subscription.start).to eq(Time.at(@attrs[:start]))
      end
    end

    describe '#end' do
      it 'is present' do
        expect(@subscription.end).to eq(Time.at(@attrs[:end]))
      end
    end

    describe '#output_type' do
      it 'is present' do
        expect(@subscription.output_type).to eq(@attrs[:output_type])
      end
    end

    describe '#output_params' do
      it 'is present' do
        expect(@subscription.output_params).to eq(@attrs[:output_params])
      end
    end
  end

  describe 'configs' do
    before do
      @attrs = {
        :output_type => "http",
        :name => "SomeName",
        :hash => "l3k4j23k4jl23j42l3k4j2l3kj4k3j4l",
        :output_params => {
          :max_size => 2097152,
          :delivery_frequency => 0,
          :url => "http =>//someurl.com/someendpoint"
        },
        :start => 1412345259,
        :end => 1412375259
      }
      @subscription = DaFace::Api::PushSubscription.new @attrs
    end

    it 'generates config' do
      expect(@subscription.generate_config).to eq(@attrs)
    end

    it 'generates output_params config' do
      expect(@subscription.output_params_config).to eq(@attrs[:output_params])
    end
  end

  # describe '#validate' do
  #   before do
  #     @attrs = {
  #       :output_type => "http",
  #       :name => "SomeName",
  #       :hash => "fc79ca5fefdb54b72292db503d686257",
  #       :output_params => {
  #         :max_size => 2097152,
  #         :delivery_frequency => 0,
  #         :url => "http =>//someurl.com/someendpoint"
  #       },
  #       :start => 1412345259,
  #       :end => 1412375259
  #     }
  #     @subscription = DaFace::Api::PushSubscription.new @attrs
  #   end
    
  #   it 'validates against Datasift' do
  #     expect(@subscription.validate).to eq(true)
  #   end
  # end
end
