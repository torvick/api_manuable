class SchemaValidator
require "json-schema"

    def self.create(params)
        JSON::Validator.fully_validate(
        File.read("./schemas/shipping_rates.json"),
        params,
        errors_as_objects: false
        )
    rescue JSON::Schema::ValidationError => e
        e
    end
end