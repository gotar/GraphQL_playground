module Types
  class Json < BaseScalar
    description "coerce to and from JSON"
    graphql_name "JSON"

    def self.coerce_input(input_value, _context)
      JSON.parse(input_value)
    rescue TypeError => e
      raise ::GraphQL::CoercionError.new("Invalid JSON format: #{e}")
    end

    def self.coerce_result(ruby_value, _context)
      JSON.dump(ruby_value)
    end
  end
end
