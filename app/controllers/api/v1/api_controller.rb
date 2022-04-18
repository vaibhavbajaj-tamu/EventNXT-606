class Api::V1::ApiController < ActionController::API
  # todo: uncomment if everything integrates well
  # before_action :set_default_response
  prepend_view_path Rails.root.join('app', 'views', 'api', 'v1')

  private
  
  def set_default_response
    request.format = :json unless params[:format]
  end
end