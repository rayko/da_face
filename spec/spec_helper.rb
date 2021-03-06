require 'simplecov'
SimpleCov.start

require 'da_face'

def fixture_path
  File.expand_path('../fixtures', __FILE__)
end

def fixture(file)
  File.read(fixture_path + '/' + file)
end

def json_fixture(file)
  JSON.parse File.read(fixture_path + '/' + file)
end

RSpec.configure do |config|
  config.after :each do
    DaFace.reset_config
    Excon.stubs.clear
  end
end
