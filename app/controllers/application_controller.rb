class ApplicationController < ActionController::API
  before_action :manuable_fedex_client
  before_action :set_response
  before_action :logs

  private

  def manuable_fedex_client
    @fedex_client ||= Rails.application.config.fedex_client
  end

  def response_method(status, data)
    params[:data] = {}
    params[:data][:code] = (status ? 200 : 400)
    params[:data][:data] = data
    response = ResponsesEngine.build!(params)
    render json: response, status: response[:code]
  end

  def logs
    n_method
    url_path
    request_id
    request_ip
    n_host
  end

  def n_method
    params[:method] = request.env["REQUEST_METHOD"]
  end

  def url_path
    params[:url_path] = request.url
  end

  def request_id
    params[:request_id] = request.request_id
  end

  def request_ip
    params[:request_ip] = request.remote_ip
  end

  def n_host
    uri = URI(params[:url_path])
    params[:get_host] = "#{uri.scheme}://#{uri.host}"
  end

  def set_response
    params[:data] = {}
  end

end