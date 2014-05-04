# ParamsPurifier

Have you ever had problems with multiple select and empty strings being sent in array params? (see [discussion](http://stackoverflow.com/questions/8929230/why-is-the-first-element-always-blank-in-my-rails-multi-select-using-an-embedde/)). Now you can easily solve that problem by using ParamsPurifier!

[![Build Status](https://travis-ci.org/Azdaroth/params_purifier.svg)](https://travis-ci.org/Azdaroth/params_purifier)

[![Gem Version](https://badge.fury.io/rb/params_purifier.svg)](http://badge.fury.io/rb/params_purifier)

[![Coverage Status](https://coveralls.io/repos/Azdaroth/params_purifier/badge.png?branch=master)](https://coveralls.io/r/Azdaroth/params_purifier?branch=master)



## Installation

Add this line to your application's Gemfile:

    gem 'params_purifier'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install params_purifier

## Usage

Just include ParamsPurifier::Purifiable module in your controller (e.g. ApplicationController):

``` ruby
class ApplicationController < ActionController::Base

  include ParamsPurifier::Purifiable

end
```

And that's it! You have an access to "purified" params by purified_params method. Works with Strong Parameters by default (it returns an instance of ActionController::Parameters):

``` ruby
def user_params
  purified_params.require(:user).permit(:email, :password, :password_confirmation)
end
```


## Contributing

1. Fork it ( https://github.com/[my-github-username]/params_purifier/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
