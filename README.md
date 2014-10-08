# DaFace

DaFace is an interface to interact with Datasift API. The good thing about DaFace is that it will present you with pretty data that you can use on your application.

# DaFace?

[Da]tasift Inter[face] -> DaFace

## Installation

(It will probably be pretty much like this, but this is still WIP)

Add this line to your application's Gemfile:

```ruby
gem 'da_face'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install da_face

## Usage

Configuration:

    DaFace.configure do |config|
      config.user = 'SomeUser'
      config.api_key = 'some_long_key'
      config.api_host = 'http://ds_custom_api_host'
      config.api_path_prefix = '/v1'
      config.adapter_class = 'DaFace::Api::Adapters::ExconAdapter'
    end

This is all you can configure for DaFace. The required configurations are user and api_key, you can leave the rest because it has default values for those.

Configuration Details:

- config.user: username in Datasift to construct the Authorization header.
- config.api_key: the api key hash given to get acess to their API.
- config.api_host: the base host of where the API is, it defaults to http://api.datasift.com
- config.api_path_prefix: a prefix to pre-pend to outgoing requests, for now it's used to set API version. It defauls to '/v1'.
- config.adapter_class: tells DaFace which adapter to use. It defauls to Daface::Api::Adapters::ExconAdapter, and it's the only one available for now. You can write your own adapter for RestClient, or any other HTTP interface.


Push Interface:

You can use DaFace to interact with the Push endpoints of the API, and define or handle subscriptions.
You can create a subscription with:

    subscription = Daface::Api::PushSubscription.new :name => 'Test', :output_params => {:auth => {:type => 'none'}, :url => 'http://somewhere.com', :delivery_frequency => 10}

You can then do other stuff with the subscription:

    subscription.validate # performs a validation of the output params
    subscription.create   # creates the subscription
    subscription.log      # returns a list of recent events in the log
    subscription.pause    # sends a pause command with the subscription id
    subscription.resume   # sends a resume command
    subscription.delete   # deletes the subscription


You can for example get a list of subscriptions:

    DaFace::Api::PushSubscription.get_all

And then perform any needed operation from the Array you get. All objects inside will be DaFace::Api::PushSubscription objects.

Parsers:

DaFace provides some parsers to deal with the push data comming from Datasift. The support of different Datasift objects is limited thought, but for each interaction you get, DaFace will transform it into a DaObject, which will provide you accessors to different data inside the interaction:

    da_object.interaction # interaction information
    da_object.twitter # twitter information

Each interaction sub-object, like twitter, will have more info inside:

    da_object.twitter.tweet    # a tweet
    da_object.twitter.tweet.id # the id of the tweet


Notes:

As mentioned avobe, support is limited, so make sure DaFace suits your needs before implementing. There's still some work to be done, such as creating some more adapters, and make it easier to use DaFace internals.

Comments, complains, recommendations, ideas, are all welcome.

## Contributing

1. Fork it ( https://github.com/rayko/da_face/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Write some specs or update existing ones
4. Write some code
5. Make sure all specs (new and older) pass
6. Commit your changes (`git commit -am 'Add some feature'`)
7. Push to the branch (`git push origin my-new-feature`)
8. Create a new Pull Request
