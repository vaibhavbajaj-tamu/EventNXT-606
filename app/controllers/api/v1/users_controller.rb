class Api::V1::UsersController < Api::V1::ApiController
  def index
    users = User.limit(params[:limit]).offset(params[:offset])
    render json: users
  end

  def show
    user = User.find(params[:id])
    if user
      render json: user
    else
      render json: user.errors(), status: :not_found
    end
  end
  
  def destroy
    user = User.find(params[:id])
    user.destroy
    head :ok 
  end
end