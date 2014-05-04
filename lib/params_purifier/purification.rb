require 'active_support/core_ext'

module ParamsPurifier
  module Purification
    
    module_function

      def execute(params)      
        purify_params(params, {})
      end

      def purify_params(original_params, new_params)
        original_params.each_with_object(new_params) do |(key, value), purified_params|
          case value
          when Array
            new_value = value.reject { |v| v.blank? } 
          when Hash
            new_value = purify_params(value, {})
          else
            new_value = value
          end
          purified_params[key] = new_value
        end
      end

  end
end