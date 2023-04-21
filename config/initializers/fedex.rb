require 'fedex'

Rails.application.config.fedex_client = Fedex::Client.new(
    Rails.application.credentials.dig(:fedex, :key), 
    Rails.application.credentials.dig(:fedex, :password), 
    Rails.application.credentials.dig(:fedex, :account_number), 
    Rails.application.credentials.dig(:fedex, :meter_number)
)