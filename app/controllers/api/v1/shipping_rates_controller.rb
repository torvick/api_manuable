class Api::V1::ShippingRatesController < ApplicationController
    before_action :validate_params
    
    def index
        @rates = Fedex::Rates.get(@fedex_client.credentials, @quote_params)
        @rates.kind_of?(Array) ? response_method(true, @rates) : response_method(false, @rates)
    end

    def create
        @rates = Fedex::Rates.get(@fedex_client.credentials, @quote_params)
        @rates.kind_of?(Array) ? response_method(true, @rates) : response_method(false, @rates)
    end

    private

    def validate_params
        validate = SchemaValidator.create(request.request_parameters)
        if validate.empty?
            @quote_params = request.request_parameters
        else
            return response_method(false, validate)
        end
    end
end
