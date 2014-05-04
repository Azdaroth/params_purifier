require 'action_controller'
require 'params_purifier/purification'

module ParamsPurifier
  module Purifiable

    def purified_params
      if respond_to? :params, true
        ActionController::Parameters.new(Purification.execute(params))
      else
        raise ParamsMethodNotImplementedError.new("Interface must implement #params method")
      end
    end

    class ParamsMethodNotImplementedError < StandardError ; end
      
  end
end