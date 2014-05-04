require 'coveralls'
Coveralls.wear!

require 'params_purifier'
require 'rspec'

RSpec.configure do |c|
  c.mock_with :rspec
end