require 'spec_helper'

describe DaFace::Api::PushSubscription do
  describe '#new' do
    before do
      @attrs = {
        :id => "ba0970fa23ee6bcbf43a0d14980320dc",
        :output_type => :http,
        :name => "LikeFolioPrimary",
        :created_at => 1412345259,
        :user_id => 28949,
        :hash => "fc79ca5fefdb54b72292db503d686257",
        :hash_type => "stream",
        :output_params => {
          :max_size => 2097152,
          :delivery_frequency => 0,
          :url => "http =>//datasift.likefolio.com/api/data_receiver"
        },
        :status => "active",
        :last_request => 1412597788,
        :last_success => 1412597789,
        :remaining_bytes => nil,
        :lost_data => false,
        :start => 1412345259,
        :end => nil
      }
    end
    
    it 'creates a PushSubscription object' do
      obj = DaFace::Api::PushSubscription.new @attrs

      expect(obj.class).to eq(DaFace::Api::PushSubscription)
    end
  end

  describe 'attributes' do
    before do
      @attrs = {
        :id => "ba0970fa23ee6bcbf43a0d14980320dc",
        :output_type => "http",
        :name => "LikeFolioPrimary",
        :created_at => 1412345259,
        :user_id => 28949,
        :hash => "fc79ca5fefdb54b72292db503d686257",
        :hash_type => "stream",
        :output_params => {
          :max_size => 2097152,
          :delivery_frequency => 0,
          :url => "http =>//datasift.likefolio.com/api/data_receiver"
        },
        :status => "active",
        :last_request => 1412597788,
        :last_success => 1412597789,
        :remaining_bytes => nil,
        :lost_data => false,
        :start => 1412345259,
        :end => nil
      }
      @subscription = DaFace::Api::PushSubscription.new @attrs
    end

    it 'has required params' do
      expect(@subscription.id).to eq(@attrs[:id])
      expect(@subscription.name).to eq(@attrs[:name])
      expect(@subscription.created_at).to eq(@attrs[:created_at])
      expect(@subscription.user_id).to eq(@attrs[:user_id])
      expect(@subscription.hash).to eq(@attrs[:hash])
      expect(@subscription.hash_type).to eq(@attrs[:hash_type])
      expect(@subscription.status).to eq(@attrs[:status])
      expect(@subscription.last_request).to eq(@attrs[:last_request])
      expect(@subscription.last_success).to eq(@attrs[:last_success])
      expect(@subscription.remaining_bytes).to eq(@attrs[:remaining_bytes])
      expect(@subscription.lost_data).to eq(@attrs[:lost_data])
      expect(@subscription.start).to eq(@attrs[:start])
      expect(@subscription.end).to eq(@attrs[:end])
      expect(@subscription.output_type).to eq(@attrs[:output_type])
      expect(@subscription.output_params).to eq(@attrs[:output_params])
    end
  end

  describe 'configs' do
    before do
      @attrs = {
        :output_type => "http",
        :name => "SomeName",
        :hash => "fc79ca5fefdb54b72292db503d686257",
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
